.class public final synthetic Lcom/android/quickstep/interaction/N;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/interaction/TutorialController;

.field public final synthetic h:Landroidx/appcompat/app/b;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/interaction/TutorialController;Landroidx/appcompat/app/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/interaction/N;->g:Lcom/android/quickstep/interaction/TutorialController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/interaction/N;->h:Landroidx/appcompat/app/b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/N;->g:Lcom/android/quickstep/interaction/TutorialController;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/N;->h:Landroidx/appcompat/app/b;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->d(Lcom/android/quickstep/interaction/TutorialController;Landroidx/appcompat/app/b;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
