## TASK-11: AWS Tools GitFlow Workshop

<br>

### Trunk-Based Development
<hr>
Trunk-based development (TBD) je metodologija razvoja softvera koja se fokusira na upotrebu glavne grane (trunka) u verzioniranju i upravljanju kodom. Osnovna ideja trunk-based developmenta je da se svi članovi tima razvoja kontinuirano integriraju i ažuriraju kod u glavnoj grani repozitorija, umjesto da rade na odvojenim granama i spajaju ih kasnije.

<br>

### GitFlow
<hr>
Git Flow je popularni model upravljanja verzioniranjem i workflow koji se koristi u Gitu za upravljanje razvojem softvera.

Git Flow definiše specifičan set grana i pravila za njihovo korištenje. Ključne grane u Git Flow modelu su:

- Master (Glavna grana): Predstavlja stabilnu verziju softvera koja se nalazi u produkciji. Na ovoj grani se nalazi samo verifikovan i testiran kod.

- Develop (Razvojna grana): Ova grana je glavna grana za razvoj softvera. Svi članovi tima rade na ovoj grani i integrišu svoje promjene u nju. Ovdje se nalazi najnovija verzija koda, ali može biti nestabilna.

Pored ovih glavnih grana, Git Flow model uvodi i dodatne grane za funkcionalnosti i ispravke grešaka:

- Feature (Funkcionalna grana): Svaka nova funkcionalnost se razvija na zasebnoj grani koja se odvaja od razvojne grane. Nakon završetka funkcionalnosti, grana se spaja nazad u razvojnu granu.

- Release: Kada se priprema nova verzija za release, kreira se grana release. Na ovoj grani se obavljaju zadnje pripreme, kao što su ispravke grešaka i testiranje, prije nego što se verzija objavi.

- Hotfix (Ispravka greške): Ako se otkrije greška u produkciji koja zahtijeva hitnu ispravku, kreira se posebna grana za ispravku greške. Nakon što se greška ispravi, grana se spaja u glavnu granu i razvojnu granu.

<br>

### AWS Cloudformation
<hr>
AWS CloudFormation je usluga koja omogućava deklarativno definisanje i upravljanje infrastrukturom kao kodom. CloudFormation olakšava automatizaciju implementacije i konfiguracije resursa u AWS cloud.

Glavna ideja iza AWS CloudFormationa je da se infrastruktura definiše u obliku templates napisanih u JSON-u (JavaScript Object Notation) ili YAML-u (YAML Ain't Markup Language) formatu. Ovi templates opisuju sve resurse potrebne za izgradnju infrastrukture, kao što su serveri, mrežni resursi, baze podataka, usluge za skladištenje podataka i drugi AWS resursi.

<br>


### Elastic Beanstalk
<hr>
Elastic Beanstalk je servis koji omogućava brzo i jednostavno raspoređivanje i upravljanje aplikacijama u AWS Cloud-u. Elastic Beanstalk automatski upravlja kapacitetom, skaliranjem, balansiranjem opterećenja i zdravljem aplikacije. Elastic Beanstalk je besplatan, plaćamo samo resurse koje koristimo za aplikacije. 

Elastic Beanstalk podržava različite platforme, kao što su Java, .NET, PHP, Node.js, Python, Ruby, Go i Docker. Elastic Beanstalk također podržava različite web servere, kao što su Apache, Nginx, Passenger i IIS. Elastic Beanstalk možemo koristiti za razvoj, testiranje, isporuku i upravljanje  aplikacijama.