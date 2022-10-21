defmodule EcolesWeb.Router do
  use EcolesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {EcolesWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EcolesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", PageController, :goTopageLogin

    get "/inscription", AdminController, :goTopageInscription
    post "/inscrire", AdminController, :insertAdmin
    get "/seconnecter", AdminController, :getAdmin
    get "/accueil", AdminController, :accueil
    post "/admin", AdminController, :connecter
    get "/signout", AdminController, :sign_out

    resources "/classe", ClassesController
    get "/voir_resultat", ClassesController, :goto_page_resultat
    post "/result", ClassesController, :result

    resources "/sexes", SexeController

    get "/inscrire", ElevesController, :gotoPageInsertEleves
    post "/inscrireOk", ElevesController, :createELeves
    get "/dteleves/:id", ElevesController, :getElevesById
    get "/eleves", ElevesController, :getListEleves
    get "/filtre", ElevesController, :getFilter
    get "/statistiques", ElevesController, :charts

    resources "/matieres", MatiereController

    get "/saisir", NotesController, :gotoPageSaisieNotes
    post "/notes", NotesController, :saisirNotes
    get "/saisire", NotesController, :get_list_eleves_classe
    get "/dtnotes/:id", NotesController, :getNotesById
    get "/filterstudy", NotesController, :getfilterstudy
    get "/bulletin", NotesController, :show_notes_study
    get "/lisitra", NotesController, :list_notes

    get"/chart", StatistiquesController, :statistiques

    get"/absence", AbsenceController, :goto_form_absence
  end

  # Other scopes may use custom stacks.
  # scope "/api", EcolesWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EcolesWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
