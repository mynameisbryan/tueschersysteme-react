import type { Schema, Struct } from '@strapi/strapi';

export interface ContactaddressContactaddress extends Struct.ComponentSchema {
  collectionName: 'components_contactaddress_contactaddresses';
  info: {
    description: '';
    displayName: 'contactaddress';
  };
  attributes: {
    city: Schema.Attribute.String;
    email: Schema.Attribute.String;
    opening_hours: Schema.Attribute.String;
    phone: Schema.Attribute.String;
    postal_code: Schema.Attribute.String;
    street: Schema.Attribute.String;
  };
}

export interface ContactaddressContactformsettings
  extends Struct.ComponentSchema {
  collectionName: 'components_contactaddress_contactformsettings';
  info: {
    displayName: 'contactformsettings';
  };
  attributes: {
    error_message: Schema.Attribute.String;
    newsletter_text: Schema.Attribute.String;
    privacy_text: Schema.Attribute.String;
    submit_button_text: Schema.Attribute.String;
    success_message: Schema.Attribute.String;
  };
}

export interface FeaturesFeatureItem extends Struct.ComponentSchema {
  collectionName: 'components_features_feature_items';
  info: {
    description: '';
    displayName: 'Feature Item';
  };
  attributes: {
    icon: Schema.Attribute.Enumeration<
      ['SHIELD', 'HOME', 'HEART', 'GEAR', 'CLOCK']
    >;
    title: Schema.Attribute.String;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'contactaddress.contactaddress': ContactaddressContactaddress;
      'contactaddress.contactformsettings': ContactaddressContactformsettings;
      'features.feature-item': FeaturesFeatureItem;
    }
  }
}
