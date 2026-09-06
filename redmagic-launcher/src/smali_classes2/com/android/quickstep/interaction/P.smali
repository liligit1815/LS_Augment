.class public final synthetic Lcom/android/quickstep/interaction/P;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/interaction/TutorialFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/interaction/TutorialFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/interaction/P;->g:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/P;->g:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/interaction/TutorialFragment;->l(Lcom/android/quickstep/interaction/TutorialFragment;Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
