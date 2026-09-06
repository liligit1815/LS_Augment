.class public final Lcom/android/quickstep/interaction/MenuFragment;
.super Lcom/android/quickstep/interaction/GestureSandboxFragment;
.source "MenuFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/interaction/MenuFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->lambda$onCreateView$3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onCreateView$0(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onCreateView$1(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onCreateView$2(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onCreateView$3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic n(Lcom/android/quickstep/interaction/MenuFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->lambda$onCreateView$2(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/android/quickstep/interaction/MenuFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->lambda$onCreateView$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/interaction/MenuFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/MenuFragment;->lambda$onCreateView$1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method canRecreateFragment()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 1
    const p3, 0x7f0e00eb

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const p2, 0x7f0b02a6

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    new-instance p3, Lcom/android/quickstep/interaction/t;

    .line 17
    .line 18
    invoke-direct {p3, p0}, Lcom/android/quickstep/interaction/t;-><init>(Lcom/android/quickstep/interaction/MenuFragment;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    const p2, 0x7f0b02a3

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance p3, Lcom/android/quickstep/interaction/u;

    .line 32
    .line 33
    invoke-direct {p3, p0}, Lcom/android/quickstep/interaction/u;-><init>(Lcom/android/quickstep/interaction/MenuFragment;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    const p2, 0x7f0b02a8

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance p3, Lcom/android/quickstep/interaction/v;

    .line 47
    .line 48
    invoke-direct {p3, p0}, Lcom/android/quickstep/interaction/v;-><init>(Lcom/android/quickstep/interaction/MenuFragment;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    const p2, 0x7f0b02a5

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    new-instance p3, Lcom/android/quickstep/interaction/w;

    .line 62
    .line 63
    invoke-direct {p3, p0}, Lcom/android/quickstep/interaction/w;-><init>(Lcom/android/quickstep/interaction/MenuFragment;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-object p1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "use_tutorial_menu"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, "tutorial_type"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "gesture_complete"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-super {p0, p1}, Landroidx/fragment/app/n;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method recreateFragment()Lcom/android/quickstep/interaction/GestureSandboxFragment;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/interaction/MenuFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/interaction/MenuFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method shouldDisableSystemGestures()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
