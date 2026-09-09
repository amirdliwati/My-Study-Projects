using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportLibrary
{
    public class Triples
    {
        private string subject;
        private string predicate;
        private string oBject;

        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }

        public string Predicate
        {
            get { return predicate; }
            set { predicate = value; }
        }

        public string Object
        {
            get { return oBject; }
            set { oBject = value; }
        }

        public Triples(string subject, string predicate, string oBject)
        {
            this.subject = subject;
            this.predicate = predicate;
            this.oBject = oBject;
        }

        public Triples() { }
    }
    public class Persons
    {
        private string person;
        public string Person
        {
            get { return person; }
            set { person = value; }
        }
        public Persons(string person)
        {
            this.person = person;
        }
        public Persons() { }
    }
    public class Mammals
    {
        private string mammal;
        public string Mammal
        {
            get { return mammal; }
            set { mammal = value; }
        }
        public Mammals(string mammal)
        {
            this.mammal = mammal;
        }
        public Mammals() { }
    }
}
