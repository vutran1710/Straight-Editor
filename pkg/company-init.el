(require 'company)
(require 'company-web-html)
(require 'company-tern)
(require 'company-jedi)
(require 'company-restclient)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-jedi)
(add-to-list 'company-backends 'company-restclient)
