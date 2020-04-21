# Testimonials

It's a metapackage for the [source code repository](https://github.com/swissup/module-testimonials).

#### Installation

```bash
cd <magento_root>
composer config repositories.swissup composer https://docs.swissuplabs.com/packages/
composer require swissup/testimonials --prefer-source
bin/magento module:enable Swissup_Core Swissup_Testimonials
bin/magento setup:upgrade
```
