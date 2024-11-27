"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isValidProductCategory = void 0;
function isValidProductCategory(category) {
    if (!category || typeof category !== 'object')
        return false;
    var requiredFields = ['id', 'attributes'];
    var requiredAttributeFields = ['Title', 'Description', 'slug', 'Image', 'products'];
    return requiredFields.every(function (field) { return field in category; }) &&
        requiredAttributeFields.every(function (field) {
            return field in category.attributes &&
                category.attributes[field] !== null;
        });
}
exports.isValidProductCategory = isValidProductCategory;
