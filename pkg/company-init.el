(require 'company)
(require 'company-tern)
(require 'company-jedi)
(require 'company-restclient)

(cl-old-struct-compat-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-jedi)
(add-to-list 'company-backends 'company-restclient)
