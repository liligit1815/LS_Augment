.class public Lcom/android/launcher3/util/S0;
.super Ljava/lang/Object;
.source "KeyboardShortcutsDelegate.java"


# instance fields
.field a:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;LO0/c$c;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/KeyboardShortcutInfo;

    .line 2
    .line 3
    iget-object v1, p1, LO0/c$c;->b:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget p1, p1, LO0/c$c;->a:I

    .line 10
    .line 11
    const/16 v2, 0x1000

    .line 12
    .line 13
    invoke-direct {v0, v1, p1, v2}, Landroid/view/KeyboardShortcutInfo;-><init>(Ljava/lang/CharSequence;II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public b(ILandroid/view/KeyEvent;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const/16 v0, 0x6f

    .line 2
    .line 3
    if-ne p1, v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->a2()Lcom/android/launcher3/V2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->a2()Lcom/android/launcher3/V2;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/android/launcher3/V2;->b()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const-string p0, "KeyboardShortcutsDelegate"

    .line 32
    .line 33
    const-string p1, "onKeyDown KEYCODE_ESCAPE mLauncherCallbacks in handleBackPressed"

    .line 34
    .line 35
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 p2, 0x1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Lcom/android/launcher3/a;->close(Z)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->V()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 75
    .line 76
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 85
    .line 86
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_4

    .line 91
    .line 92
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 93
    .line 94
    sget-object v1, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 95
    .line 96
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 104
    .line 105
    sget-object v1, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 106
    .line 107
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, v0, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 120
    .line 121
    .line 122
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 132
    .line 133
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_5
    const/4 p0, 0x0

    .line 140
    return-object p0
.end method

.method public c(ILandroid/view/KeyEvent;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const/16 v0, 0x1000

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    const/16 p2, 0x1d

    .line 10
    .line 11
    if-eq p1, p2, :cond_2

    .line 12
    .line 13
    const/16 p2, 0x33

    .line 14
    .line 15
    if-eq p1, p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p2, v0}, LO0/r;->A(Lcom/android/launcher3/C2;Landroid/view/View;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, LO0/c$c;

    .line 42
    .line 43
    iget v1, v0, LO0/c$c;->a:I

    .line 44
    .line 45
    if-ne v1, p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, LO0/c$c;->a(Landroid/view/View;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 65
    .line 66
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/android/launcher3/views/OptionsPopupView;->Y(Lcom/android/launcher3/C2;)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 75
    .line 76
    .line 77
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 83
    .line 84
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget-object p1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 99
    .line 100
    .line 101
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_3
    const/4 p0, 0x0

    .line 105
    return-object p0
.end method

.method public d(ILandroid/view/KeyEvent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/16 p2, 0x52

    .line 2
    .line 3
    if-ne p1, p2, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 32
    .line 33
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->k1()V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    const-string p1, "TaplTarget"

    .line 51
    .line 52
    const-string p2, "Opening options popup on key up"

    .line 53
    .line 54
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 58
    .line 59
    const/high16 p1, -0x40800000    # -1.0f

    .line 60
    .line 61
    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/C2;->F4(FF)V

    .line 62
    .line 63
    .line 64
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_2
    const/4 p0, 0x0

    .line 68
    return-object p0
.end method

.method public e(Ljava/util/List;Landroid/view/Menu;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/KeyboardShortcutGroup;",
            ">;",
            "Landroid/view/Menu;",
            "I)V"
        }
    .end annotation

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    invoke-interface {p3, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    new-instance p3, Landroid/view/KeyboardShortcutInfo;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    const v1, 0x7f14006a

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/16 v1, 0x1d

    .line 28
    .line 29
    const/16 v2, 0x1000

    .line 30
    .line 31
    invoke-direct {p3, v0, v1, v2}, Landroid/view/KeyboardShortcutInfo;-><init>(Ljava/lang/CharSequence;II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    new-instance p3, Landroid/view/KeyboardShortcutInfo;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    const v1, 0x7f14047b

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/16 v1, 0x33

    .line 49
    .line 50
    invoke-direct {p3, v0, v1, v2}, Landroid/view/KeyboardShortcutInfo;-><init>(Ljava/lang/CharSequence;II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {p3}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p3, v0}, LO0/r;->A(Lcom/android/launcher3/C2;Landroid/view/View;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    new-instance v0, Lcom/android/launcher3/util/R0;

    .line 67
    .line 68
    invoke-direct {v0, p2}, Lcom/android/launcher3/util/R0;-><init>(Ljava/util/ArrayList;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {p3, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    if-nez p3, :cond_1

    .line 79
    .line 80
    new-instance p3, Landroid/view/KeyboardShortcutGroup;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/util/S0;->a:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    const v0, 0x7f140201

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-direct {p3, p0, p2}, Landroid/view/KeyboardShortcutGroup;-><init>(Ljava/lang/CharSequence;Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method
