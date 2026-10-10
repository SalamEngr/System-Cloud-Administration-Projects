# System & Cloud Administration Projects

## Project Overview

This repository documents a virtual home lab built to practise enterprise Windows Server and Active Directory administration, plus the help desk, resource-access, and Group Policy tasks a Systems Administrator handles day to day. Every lab is logged as a GitHub Issue in the [IT Virtual Home Lab project board](https://github.com/users/SalamEngr/projects/2), each with step-by-step notes and screenshots.

## Lab Environment

| Component          | Details                                  |
|---------------------|-------------------------------------------|
| Virtualization      | Oracle VirtualBox                        |
| Domain Controller    | Windows Server 2022 — `DC-01`            |
| Domain               | `LABHOME.local`                          |
| Client               | Windows 11 (domain-joined)               |
| Core Services        | AD DS, DNS, Group Policy, File & Print Services |
| Automation           | Windows PowerShell, Active Directory cmdlets, CSV files |

## Completed Labs

| # | Topic                                      | Status   | Details |
|---|----------------------------------------------|----------|---------|
| 1 | VirtualBox Installation                     | Complete | [Issue #1](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/1) |
| 2 | Windows 11 VM Installation                  | Complete | [Issue #2](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/2) |
| 3 | Windows Server 2022 Installation            | Complete | [Issue #3](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/3) |
| 4 | Active Directory Domain Services Setup      | Complete | [Issue #4](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/4) |
| 5 | Domain Provisioning & Onboarding            | Complete | [Issue #5](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/5) |
| 6 | Help Desk Support Tasks                     | Complete | [Issue #6](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/6) |
| 7 | Shared Folder & Permissions Management      | Complete | [Issue #7](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/7) |
| 8 | Group Policy Object (GPO) Configuration     | Complete | [Issue #8](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/8) |
| 9 | PowerShell Automation for Active Directory  | Complete | [Issue #9](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/9)
## Skills Practised

Windows Server administration, Active Directory Domain Services (AD DS), domain controller promotion, static IP & network adapter configuration (Host-Only/NAT), DNS, user and security group management, computer domain-join, GPO creation and linking, password & account lockout policy, Group Policy Preferences (drive mapping), desktop wallpaper deployment, removable storage restrictions, shared folder permissions (NTFS/share-level), help desk account support (password reset, lockout, disable/enable),CSV-based bulk processing, Active Directory cmdlets, user onboarding, password resets, account disabling, bulk attribute updates, report generation and technical documentation.

---

## Lab 1–3: Building the Virtual Infrastructure

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/1)

Installed Oracle VirtualBox as the hypervisor for the lab, then built out the two core machines: a Windows 11 client VM ([Issue #2](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/2)) to simulate an end-user workstation, and a Windows Server 2022 VM ([Issue #3](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/3)) to serve as the domain controller.

## Lab 4: Active Directory Domain Services Setup

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/4)

Prepared the server for AD DS by renaming it to `DC-01`, configuring a Host-Only adapter for isolated internal communication plus a NAT adapter for internet access, and assigning a static IP so client machines could reliably resolve DNS and locate the domain controller. Installed the Active Directory Domain Services role, created a new forest (`LABHOME.local`), and promoted the server to domain controller.

## Lab 5: Domain Provisioning & Employee Onboarding

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/5)

Simulated onboarding a new employee end to end: created user accounts with temporary passwords (forcing a reset at first logon) and organized them into department-based security groups; configured the client's network settings to reach the AD DS-hosted DNS server and joined it to the `LABHOME.local` domain; verified the join in Active Directory; and signed in with a domain account to confirm authentication was working.

## Lab 6: Help Desk Support Tasks

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/6)

Practised the tickets a help desk technician handles most often:

- **Password reset** — verified the user's identity, reset the password with a temporary one, and enabled "must change password at next logon"
- **Account lockout** — investigated and unlocked an account locked out after repeated failed sign-ins
- **Disabled account** — disabled and re-enabled a user account to control access

## Lab 7: Shared Folder & Permissions Management

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/7)

Set up department-based shared folder access: added a user to the appropriate security group, created a departmental shared folder on the server, granted the group the required NTFS/share permissions, mapped the drive on the user's machine, and confirmed the user could access it.

## Lab 8: Group Policy Object (GPO) Configuration

[Full details, screenshots →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/8)

Configured and tested five GPOs commonly used in enterprise AD environments, linked to `DC-01`:

| GPO | Purpose |
|---|---|
| Password Policy | Enforces password history, min/max age, and minimum length |
| Account Lockout Policy | Locks accounts after repeated failed sign-ins to prevent brute-force attacks — tested and verified against a live user account |
| Drive Mapping | Auto-maps a department's shared folder as a network drive via Group Policy Preferences, scoped to an OU |
| Desktop Wallpaper Deployment | Pushes a standard corporate wallpaper domain-wide |
| Removable Storage Restrictions | Blocks USB and other removable media to reduce data-leakage and malware risk |

## Lab 9: PowerShell Automation for Active Directory

Objective: Automate repetitive Active Directory administration tasks using PowerShell to reduce manual work, improve consistency, and practise administrative scripting.

[View the PowerShell Automation Mini-Project documentation →](https://github.com/SalamEngr/System-Cloud-Administration-Projects/issues/9)

This phase extends the existing Active Directory lab by using PowerShell scripts and CSV files to perform five administrative tasks.

- **Employee Onboarding**

Automated the creation of five Active Directory user accounts from a CSV file containing employee information, including first name, last name, username, department, job title, and Organizational Unit.

Verified account creation, corrected missing last-name attributes during testing, and confirmed that a newly created user could sign in and change their temporary password.

- **Bulk Password Resets**

Created a CSV-driven workflow to reset passwords for selected Active Directory accounts. Tested the process by signing in with a reset password and verifying that the user was required to change it before completing the login process.

-**Disabling Multiple User Accounts**

Automated the disabling of selected accounts. The script checks whether an account is already disabled before attempting an action, returning an appropriate status and avoiding unnecessary changes.

-**Bulk User Attribute Updates**

Used a CSV file and PowerShell script to update information for selected Active Directory users, then verified the changes in Active Directory.

-**Active Directory Reporting**

Used the Get-ADUser cmdlet to retrieve user information and export the results to a CSV report. Imported the generated report back into PowerShell to verify that the exported information matched the retrieved Active Directory data.

Skills Developed Through Automation
PowerShell scripting and Active Directory cmdlets
CSV data import and export
Bulk user provisioning and account management
Conditional logic and account-status checks
Password management and first-logon security configuration
Bulk modification of user attributes
Report generation and output verification
Troubleshooting and technical documentation

The automation exercises demonstrate how PowerShell can replace repetitive manual administrative actions with repeatable, script-driven workflows.

---

*This lab is ongoing — new labs are added as the environment is extended toward a hybrid on-premises/Azure setup.*
