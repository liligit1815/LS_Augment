.class public abstract Landroidx/preference/PreferenceHeaderFragmentCompat;
.super Landroidx/fragment/app/n;
.source "PreferenceHeaderFragmentCompat.kt"

# interfaces
.implements Landroidx/preference/PreferenceFragmentCompat$e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/preference/PreferenceHeaderFragmentCompat$a;
    }
.end annotation


# instance fields
.field private g:Landroidx/activity/o;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/n;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Landroidx/preference/PreferenceHeaderFragmentCompat;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->s(Landroidx/preference/PreferenceHeaderFragmentCompat;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic n(Landroidx/preference/PreferenceHeaderFragmentCompat;)Landroidx/activity/o;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/PreferenceHeaderFragmentCompat;->g:Landroidx/activity/o;

    .line 2
    .line 3
    return-object p0
.end method

.method private final o(Landroid/view/LayoutInflater;)Lj0/b;
    .locals 6

    .line 1
    new-instance v0, Lj0/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lj0/b;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Landroidx/preference/l;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setId(I)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Landroidx/fragment/app/FragmentContainerView;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Landroidx/fragment/app/FragmentContainerView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    sget v2, Landroidx/preference/l;->c:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setId(I)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Lj0/b$e;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Landroidx/preference/j;->b:I

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v4, -0x1

    .line 42
    invoke-direct {v2, v3, v4}, Lj0/b$e;-><init>(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v5, Landroidx/preference/m;->b:I

    .line 50
    .line 51
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getInteger(I)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    int-to-float v3, v3

    .line 56
    iput v3, v2, Lj0/b$e;->a:F

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Landroidx/fragment/app/FragmentContainerView;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {v1, p1}, Landroidx/fragment/app/FragmentContainerView;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    sget p1, Landroidx/preference/l;->b:I

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setId(I)V

    .line 73
    .line 74
    .line 75
    new-instance p1, Lj0/b$e;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    sget v3, Landroidx/preference/j;->a:I

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-direct {p1, v2, v4}, Lj0/b$e;-><init>(II)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget v2, Landroidx/preference/m;->a:I

    .line 95
    .line 96
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    int-to-float p0, p0

    .line 101
    iput p0, p1, Lj0/b$e;->a:F

    .line 102
    .line 103
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    return-object v0
.end method

.method private static final s(Landroidx/preference/PreferenceHeaderFragmentCompat;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/preference/PreferenceHeaderFragmentCompat;->g:Landroidx/activity/o;

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/F;->q0()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-virtual {v0, p0}, Landroidx/activity/o;->m(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private final t(Landroid/content/Intent;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->startActivity(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final u(Landroidx/preference/Preference;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroidx/preference/Preference;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/preference/Preference;->s()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Landroidx/preference/PreferenceHeaderFragmentCompat;->t(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroidx/fragment/app/F;->u0()Landroidx/fragment/app/w;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2, v0}, Landroidx/fragment/app/w;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/n;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    invoke-virtual {p1}, Landroidx/preference/Preference;->m()Landroid/os/Bundle;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v0, p1}, Landroidx/fragment/app/n;->setArguments(Landroid/os/Bundle;)V

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroidx/fragment/app/F;->q0()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 v1, 0x1

    .line 62
    if-lez p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p1, v2}, Landroidx/fragment/app/F;->p0(I)Landroidx/fragment/app/F$j;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string v2, "childFragmentManager.getBackStackEntryAt(0)"

    .line 74
    .line 75
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-interface {p1}, Landroidx/fragment/app/F$j;->getId()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-virtual {v2, p1, v1}, Landroidx/fragment/app/F;->Y0(II)V

    .line 87
    .line 88
    .line 89
    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string v2, "childFragmentManager"

    .line 94
    .line 95
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v2, "beginTransaction()"

    .line 103
    .line 104
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v1}, Landroidx/fragment/app/N;->s(Z)Landroidx/fragment/app/N;

    .line 108
    .line 109
    .line 110
    sget v1, Landroidx/preference/l;->b:I

    .line 111
    .line 112
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v1, v0}, Landroidx/fragment/app/N;->o(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Lj0/b;->m()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_4

    .line 127
    .line 128
    const/16 v0, 0x1003

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Landroidx/fragment/app/N;->t(I)Landroidx/fragment/app/N;

    .line 131
    .line 132
    .line 133
    :cond_4
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lj0/b;->q()Z

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1}, Landroidx/fragment/app/N;->h()I

    .line 141
    .line 142
    .line 143
    return-void
.end method


# virtual methods
.method public h(Landroidx/preference/PreferenceFragmentCompat;Landroidx/preference/Preference;)Z
    .locals 4

    .line 1
    const-string v0, "caller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pref"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/fragment/app/n;->getId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sget v1, Landroidx/preference/l;->c:I

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p2}, Landroidx/preference/PreferenceHeaderFragmentCompat;->u(Landroidx/preference/Preference;)V

    .line 21
    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/n;->getId()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    sget v0, Landroidx/preference/l;->b:I

    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroidx/fragment/app/F;->u0()Landroidx/fragment/app/w;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p2}, Landroidx/preference/Preference;->o()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v1, v3}, Landroidx/fragment/app/w;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/n;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v1, "childFragmentManager.fra\u2026.fragment!!\n            )"

    .line 60
    .line 61
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Landroidx/preference/Preference;->m()Landroid/os/Bundle;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Landroidx/fragment/app/n;->setArguments(Landroid/os/Bundle;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p2, "childFragmentManager"

    .line 76
    .line 77
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p2, "beginTransaction()"

    .line 85
    .line 86
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v2}, Landroidx/fragment/app/N;->s(Z)Landroidx/fragment/app/N;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/N;->o(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 93
    .line 94
    .line 95
    const/16 p1, 0x1003

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroidx/fragment/app/N;->t(I)Landroidx/fragment/app/N;

    .line 98
    .line 99
    .line 100
    const/4 p1, 0x0

    .line 101
    invoke-virtual {p0, p1}, Landroidx/fragment/app/N;->g(Ljava/lang/String;)Landroidx/fragment/app/N;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroidx/fragment/app/N;->h()I

    .line 105
    .line 106
    .line 107
    return v2

    .line 108
    :cond_1
    const/4 p0, 0x0

    .line 109
    return p0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroidx/fragment/app/n;->onAttach(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getParentFragmentManager()Landroidx/fragment/app/F;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "parentFragmentManager"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "beginTransaction()"

    .line 23
    .line 24
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroidx/fragment/app/N;->r(Landroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/fragment/app/N;->h()I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 1
    const-string p2, "inflater"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Landroidx/preference/PreferenceHeaderFragmentCompat;->o(Landroid/view/LayoutInflater;)Lj0/b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget p3, Landroidx/preference/l;->c:I

    .line 15
    .line 16
    invoke-virtual {p2, p3}, Landroidx/fragment/app/F;->h0(I)Landroidx/fragment/app/n;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->r()Landroidx/preference/PreferenceFragmentCompat;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "childFragmentManager"

    .line 31
    .line 32
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "beginTransaction()"

    .line 40
    .line 41
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-virtual {p0, v0}, Landroidx/fragment/app/N;->s(Z)Landroidx/fragment/app/N;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p3, p2}, Landroidx/fragment/app/N;->b(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/fragment/app/N;->h()I

    .line 52
    .line 53
    .line 54
    :cond_0
    const/4 p0, 0x3

    .line 55
    invoke-virtual {p1, p0}, Lj0/b;->setLockMode(I)V

    .line 56
    .line 57
    .line 58
    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/n;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    new-instance p2, Landroidx/preference/PreferenceHeaderFragmentCompat$a;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Landroidx/preference/PreferenceHeaderFragmentCompat$a;-><init>(Landroidx/preference/PreferenceHeaderFragmentCompat;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Landroidx/preference/PreferenceHeaderFragmentCompat;->g:Landroidx/activity/o;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, LJ/I;->O(Landroid/view/View;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/view/View;->isLayoutRequested()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->n(Landroidx/preference/PreferenceHeaderFragmentCompat;)Landroidx/activity/o;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lj0/b;->n()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lj0/b;->m()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/4 v0, 0x0

    .line 62
    :goto_0
    invoke-virtual {p2, v0}, Landroidx/activity/o;->m(Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    new-instance v0, Landroidx/preference/PreferenceHeaderFragmentCompat$b;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Landroidx/preference/PreferenceHeaderFragmentCompat$b;-><init>(Landroidx/preference/PreferenceHeaderFragmentCompat;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    new-instance v0, Landroidx/preference/d;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Landroidx/preference/d;-><init>(Landroidx/preference/PreferenceHeaderFragmentCompat;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroidx/fragment/app/F;->j(Landroidx/fragment/app/F$m;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1}, Landroidx/activity/u;->a(Landroid/view/View;)Landroidx/activity/r;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    invoke-interface {p1}, Landroidx/activity/r;->getOnBackPressedDispatcher()Landroidx/activity/p;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-nez p1, :cond_3

    .line 98
    .line 99
    :goto_2
    return-void

    .line 100
    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getViewLifecycleOwner()LW/d;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    iget-object p0, p0, Landroidx/preference/PreferenceHeaderFragmentCompat;->g:Landroidx/activity/o;

    .line 105
    .line 106
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, p2, p0}, Landroidx/activity/p;->h(LW/d;Landroidx/activity/o;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/n;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->q()Landroidx/fragment/app/n;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "childFragmentManager"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "beginTransaction()"

    .line 27
    .line 28
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Landroidx/fragment/app/N;->s(Z)Landroidx/fragment/app/N;

    .line 33
    .line 34
    .line 35
    sget v0, Landroidx/preference/l;->b:I

    .line 36
    .line 37
    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/N;->o(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/fragment/app/N;->h()I

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final p()Lj0/b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lj0/b;

    .line 6
    .line 7
    return-object p0
.end method

.method public q()Landroidx/fragment/app/n;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Landroidx/preference/l;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/fragment/app/F;->h0(I)Landroidx/fragment/app/n;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    check-cast v0, Landroidx/preference/PreferenceFragmentCompat;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-gtz v1, :cond_0

    .line 25
    .line 26
    return-object v2

    .line 27
    :cond_0
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v3, 0x0

    .line 36
    :goto_0
    if-ge v3, v1, :cond_4

    .line 37
    .line 38
    add-int/lit8 v4, v3, 0x1

    .line 39
    .line 40
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v5, v3}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v5, "headerFragment.preferenc\u2026reen.getPreference(index)"

    .line 49
    .line 50
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Landroidx/preference/Preference;->o()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    if-nez v5, :cond_1

    .line 58
    .line 59
    move v3, v4

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {v3}, Landroidx/preference/Preference;->o()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getChildFragmentManager()Landroidx/fragment/app/F;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroidx/fragment/app/F;->u0()Landroidx/fragment/app/w;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v1, p0, v0}, Landroidx/fragment/app/w;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/n;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    :goto_1
    if-nez v2, :cond_3

    .line 89
    .line 90
    return-object v2

    .line 91
    :cond_3
    invoke-virtual {v3}, Landroidx/preference/Preference;->m()Landroid/os/Bundle;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v2, p0}, Landroidx/fragment/app/n;->setArguments(Landroid/os/Bundle;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-object v2

    .line 99
    :cond_5
    new-instance p0, Ljava/lang/NullPointerException;

    .line 100
    .line 101
    const-string v0, "null cannot be cast to non-null type androidx.preference.PreferenceFragmentCompat"

    .line 102
    .line 103
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw p0
.end method

.method public abstract r()Landroidx/preference/PreferenceFragmentCompat;
.end method
