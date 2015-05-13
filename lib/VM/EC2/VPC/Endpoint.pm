package VM::EC2::VPC::Endpoint;

=head1 NAME

VM::EC2::VPC::Endpoint - Virtual Private Cloud Endpoint

=head1 SYNOPSIS

 use VM::EC2;

 my $ec2       = VM::EC2->new(...);
 my @ep        = $ec2->describe_vpc_endpoints();
 print $_->vpcEndpointId,"\n" foreach @ep;

=head1 DESCRIPTION

This object represents an Amazon EC2 VPC Endpoint returned by
VM::EC2->describe_vpc_endpoints()

=head1 METHODS

These object methods are supported:

 creationTimestamp            -- The date and time the VPC endpoint was created.

 policyDocument               -- The policy document associated with the
                                 endpoint.
 routeTableIds                -- One or more route tables associated with the
                                 endpoint.

 serviceName                  -- The name of the AWS service to which the
                                 endpoint is associated.

 state                        -- The state of the VPC endpoint.
                                 Valid Values: Pending | Available | 
                                 Deleting | Deleted

 vpcEndpointId                -- The ID of the VPC endpoint.

 vpcId                        -- The ID of the VPC to which the endpoint is
                                 associated.

=head1 STRING OVERLOADING

When used in a string context, this object will interpolate a string
containing the VPC ID.

=head1 SEE ALSO

L<VM::EC2>
L<VM::EC2::Generic>

=head1 AUTHOR

Lance Kinley E<lt>lkinley@loyaltymethods.comE<gt>.

Copyright (c) 2015 Loyalty Methods, Inc.

This package and its accompanying libraries is free software; you can
redistribute it and/or modify it under the terms of the GPL (either
version 1, or at your option, any later version) or the Artistic
License 2.0.  Refer to LICENSE for the full license text. In addition,
please see DISCLAIMER.txt for disclaimers of warranty.

=cut

use strict;
use base 'VM::EC2::Generic';
use Carp 'croak';

use overload
    '""'     => sub {
        my $self = shift;
        return $self->vpcId },
    fallback => 1;

sub valid_fields {
    my $self  = shift;
    return qw(creationTimestamp policyDocument routeTableIds 
              serviceName state vpcEndpointId vpcId);
}

1;

