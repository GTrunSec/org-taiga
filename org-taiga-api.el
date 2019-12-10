;;; org-taiga-api.el --- Taiga REST API interaction utilities -*- lexical-binding: t -*-

;; Copyright (c) 2019 Konstantin Sorokin (GNU/GPL Licence)

;; Authors: Konstantin Sorokin <sorokin.kc@gmail.com>

;; This file is NOT part of GNU Emacs.

;; This application is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This application is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this application.
;; If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;

;;; Code:
(require 'cl-lib)
(require 'request)

(require 'org-taiga-structs)

(defconst org-taiga-api-prefix "api/v1"
  "Taiga URL part corresponding to REST API.")

(cl-defun org-taiga--request-endpoint (endpoint
                                       &rest settings
                                       &key
                                       (parser 'json-read)
                                       &allow-other-keys)
  "Small wrapper around `request' to send requsts to the given ENDPOINT.

Has sensible defaults, forwards all its arguments to `request'."
  (let* ((url (format "%s/%s/%s" org-taiga-url org-taiga-api-prefix endpoint))
         (auth-header (format "Bearer %s" org-taiga-auth-token))
         (headers (list (cons "Authorization" auth-header))))
    (apply 'request url :headers headers :parser parser settings)))

(defun org-taiga--get-project-by-slug (slug)
  "Get information for project specified by SLUG."
  (let ((endpoint "projects/by_slug")
        (params (list (cons "slug" slug))))
    (org-taiga--request-endpoint
     endpoint
     :params params
     :success (cl-function
               (lambda (&key data &allow-other-keys)
                 ()))))

  (defun org-taiga--get-milestone-stories (milestone)
    "Get list of user stories for the given MILESTONE."
    (let ((endpoint "userstories")
          (params (list (cons "milestone" (oref milestone id)))))
      (org-taiga--request-endpoint
       endpoint
       :params params
       :success (cl-function
                 (lambda (&key data &allow-other-keys)
                   )))))

  (defun org-taiga--get-tasks (user-story)
    "Get list of tasks for the given USER-STORY."
    (let ((endpoint "tasks")
          (params (list (cons "user_story" (oref user-story id)))))
      (org-taiga--request-endpoint
       endpoint
       :params params
       :success (cl-function
                 (lambda (&key data &allow-other-keys)
                   )))))

(provide 'org-taiga-api)
;;; org-taiga-api.el ends here
