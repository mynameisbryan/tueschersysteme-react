import type { Schema, Struct } from '@strapi/strapi';

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
      'features.feature-item': FeaturesFeatureItem;
    }
  }
}
