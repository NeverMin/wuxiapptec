# --
# Kernel/Language/it_Survey.pm - translation file
# Copyright (C) 2001-2013 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it_Survey;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAASurvey
    $Self->{Translation}->{'- Change Status -'} = '';
    $Self->{Translation}->{'Add New Survey'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Modifica Sondaggio';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Modifica le domande del sondaggio';
    $Self->{Translation}->{'Question Edit'} = '';
    $Self->{Translation}->{'Answer Edit'} = '';
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = '';
    $Self->{Translation}->{'Status changed.'} = '';
    $Self->{Translation}->{'Thank you for your feedback.'} = '';
    $Self->{Translation}->{'The survey is finished.'} = '';
    $Self->{Translation}->{'Complete'} = 'Sondaggi completi';
    $Self->{Translation}->{'Incomplete'} = 'Sondaggi incompleti';
    $Self->{Translation}->{'Checkbox (List)'} = '';
    $Self->{Translation}->{'Radio'} = '';
    $Self->{Translation}->{'Radio (List)'} = '';
    $Self->{Translation}->{'Stats Overview'} = 'Risultati statistici';
    $Self->{Translation}->{'Survey Description'} = 'Descrizione del sondaggio';
    $Self->{Translation}->{'Survey Introduction'} = 'Introduzione del sondaggio';
    $Self->{Translation}->{'Yes/No'} = '';
    $Self->{Translation}->{'YesNo'} = '';
    $Self->{Translation}->{'answered'} = '';
    $Self->{Translation}->{'not answered'} = '';
    $Self->{Translation}->{'Stats Detail'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = '';

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Creazione nuovo sondaggio';
    $Self->{Translation}->{'Introduction'} = 'Introduzione';
    $Self->{Translation}->{'Internal Description'} = 'Descrizione ad uso interno';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Modifica le informazioni generali';
    $Self->{Translation}->{'Survey#'} = 'Sondaggio#';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Modifica le domande';
    $Self->{Translation}->{'Add Question'} = 'Aggiungi domanda';
    $Self->{Translation}->{'Type the question'} = 'Inserisci la domanda';
    $Self->{Translation}->{'Answer required'} = '';
    $Self->{Translation}->{'Survey Questions'} = 'Voci del Sondaggio';
    $Self->{Translation}->{'Question'} = 'Domanda';
    $Self->{Translation}->{'Answer Required'} = '';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Non ci sono voci per questo sondaggio';
    $Self->{Translation}->{'Edit Question'} = 'Modifica domanda';
    $Self->{Translation}->{'go back to questions'} = 'Ritorna alle domande';
    $Self->{Translation}->{'Possible Answers For'} = 'Possibili risposte';
    $Self->{Translation}->{'Add Answer'} = 'Aggiungi risposta';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Non sono previste risposte multiple, il destinatario inserisce del testo libero';
    $Self->{Translation}->{'Go back'} = 'Indietro';
    $Self->{Translation}->{'Edit Answer'} = 'Modifica risposta';
    $Self->{Translation}->{'go back to edit question'} = 'Ritorna a modificare le domande';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Impostazioni';
    $Self->{Translation}->{'Max. shown Surveys per page'} = 'Numero massimo di sondaggi per pagina';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Mittente del sondaggio';
    $Self->{Translation}->{'Notification Subject'} = 'Oggetto del sondaggio';
    $Self->{Translation}->{'Notification Body'} = 'Corpo del sondaggio';
    $Self->{Translation}->{'Changed By'} = 'Modificato da';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = '';
    $Self->{Translation}->{'Requests Table'} = 'Tabella delle richieste';
    $Self->{Translation}->{'Send Time'} = 'Data e Ora di invio';
    $Self->{Translation}->{'Vote Time'} = 'Data e Ora di compilazione';
    $Self->{Translation}->{'Survey Stat Details'} = 'Dettagli statistici sul Sondaggio';
    $Self->{Translation}->{'go back to stats overview'} = 'Ritorna alle statistiche';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Informazioni sul sondaggio';
    $Self->{Translation}->{'Sent requests'} = 'Sondaggi inviati';
    $Self->{Translation}->{'Received surveys'} = 'Sondaggi ricevuti';
    $Self->{Translation}->{'Survey Details'} = 'Dettagli sul sondaggio';
    $Self->{Translation}->{'Survey Results Graph'} = 'Grafici sul sondaggio';
    $Self->{Translation}->{'No stat results.'} = 'Non ci sono risultati da mostrare';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Sondaggio';
    $Self->{Translation}->{'Please answer these questions'} = '';
    $Self->{Translation}->{'Show my answers'} = '';
    $Self->{Translation}->{'These are your answers'} = '';
    $Self->{Translation}->{'Survey Title'} = '';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Un modulo per i sondaggi.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Un modulo per modificare le domande dei sondaggi.';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Tutti i parametri del sondaggio nell\'interfaccia Agente.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        '';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Corpo del testo di default per la notifica via email al cliente riguardo un nuovo sondaggio.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Mittente di default per la notifica via email al cliente riguardo un nuovo sondaggio.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Oggetto di default per la notifica via email al cliente riguardo un nuovo sondaggio.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Definisce il modulo per mostrare la visualizzazione compatta di una lista di sondaggi.';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        '';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ).'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Definisce l\'altezza di default per la vista completa per gli elementi SurveyZoom.';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        '';
    $Self->{Translation}->{'Edit Survey General Information'} = '';
    $Self->{Translation}->{'Edit Survey Questions'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Modulo di registrazione per il sondaggio nell\'area Agente.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Modulo di registrazione per il sondaggio nell\'area di Sondaggi Pubblici.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Se questa sottostringa viene riconosciuta, il sondaggio non viene inviato.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parametri per la visualizzazione "compatta".';
    $Self->{Translation}->{'Public Survey.'} = 'Sondaggio pubblico.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Survey Edit Module.'} = '';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Limite per visualizzazione "compatta".';
    $Self->{Translation}->{'Survey Stats Module.'} = '';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Modulo di zoom per i sondaggi.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small"'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = '';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Identificativo per il sondaggio, per esempio Sondaggio#, Inchiesta#. Il default Sondaggio#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        '';
    $Self->{Translation}->{'Zoom Into Statistics Details'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Changed Time'} = 'Data e Ora di modifica';
    $Self->{Translation}->{'Created By'} = 'Creato da';
    $Self->{Translation}->{'Created Time'} = 'Data e Ora di creazione';
    $Self->{Translation}->{'Days starting from the latest customer survey email between no customer survey email is sent, ( 0 means Always send it ) .'} =
        'Giorni dall\'ultimo sondaggio prima che venga inviato un nuovo sondaggio (0 indica di mandarlo sempre) .';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the column.'} =
        'Definisce le colonne visibili nella visualizzazione Sondaggi. L\'opzione non ha effetto sul posizionamento delle colonne.';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen on public interface to show data of an specific votation when customer tries to answer a survey by second time.'} =
        'Abilita o Disabilita la schermata di votazione sull\'interfaccia pubblica per mostrare i dati di un sondaggio specifico se si tenta di inserire i dati per due volte.';
    $Self->{Translation}->{'General Info'} = 'Informazioni Generali';
    $Self->{Translation}->{'Please answer the next questions'} = 'Per cortesia, rispondete alle seguenti domande';
    $Self->{Translation}->{'Stats Details'} = 'Dettagli statistici';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = 'Numero di sondaggi per pagina per vista "compatta".';
    $Self->{Translation}->{'This field is required'} = 'Campo Obbligatorio';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket gets closed.'} =
        'Modulo per gestire l\'invio automatico di email al cliente quando un ticket viene chiuso.';

}

1;
