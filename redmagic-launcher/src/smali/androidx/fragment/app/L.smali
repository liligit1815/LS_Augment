.class Landroidx/fragment/app/L;
.super Ljava/lang/Object;
.source "FragmentStateManager.java"


# instance fields
.field private final a:Landroidx/fragment/app/z;

.field private final b:Landroidx/fragment/app/M;

.field private final c:Landroidx/fragment/app/n;

.field private d:Z

.field private e:I


# direct methods
.method constructor <init>(Landroidx/fragment/app/z;Landroidx/fragment/app/M;Landroidx/fragment/app/n;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Landroidx/fragment/app/L;->e:I

    .line 4
    iput-object p1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 5
    iput-object p2, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 6
    iput-object p3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    return-void
.end method

.method constructor <init>(Landroidx/fragment/app/z;Landroidx/fragment/app/M;Landroidx/fragment/app/n;Landroid/os/Bundle;)V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    const/4 v1, -0x1

    .line 22
    iput v1, p0, Landroidx/fragment/app/L;->e:I

    .line 23
    iput-object p1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 24
    iput-object p2, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 25
    iput-object p3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    const/4 p0, 0x0

    .line 26
    iput-object p0, p3, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 27
    iput-object p0, p3, Landroidx/fragment/app/n;->mSavedViewRegistryState:Landroid/os/Bundle;

    .line 28
    iput v0, p3, Landroidx/fragment/app/n;->mBackStackNesting:I

    .line 29
    iput-boolean v0, p3, Landroidx/fragment/app/n;->mInLayout:Z

    .line 30
    iput-boolean v0, p3, Landroidx/fragment/app/n;->mAdded:Z

    .line 31
    iget-object p1, p3, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    if-eqz p1, :cond_0

    iget-object p1, p1, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object p1, p0

    :goto_0
    iput-object p1, p3, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 32
    iput-object p0, p3, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 33
    iput-object p4, p3, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 34
    const-string p0, "arguments"

    invoke-virtual {p4, p0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    iput-object p0, p3, Landroidx/fragment/app/n;->mArguments:Landroid/os/Bundle;

    return-void
.end method

.method constructor <init>(Landroidx/fragment/app/z;Landroidx/fragment/app/M;Ljava/lang/ClassLoader;Landroidx/fragment/app/w;Landroid/os/Bundle;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    const/4 v0, -0x1

    .line 9
    iput v0, p0, Landroidx/fragment/app/L;->e:I

    .line 10
    iput-object p1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 11
    iput-object p2, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 12
    const-string p1, "state"

    invoke-virtual {p5, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/K;

    .line 13
    invoke-virtual {p1, p4, p3}, Landroidx/fragment/app/K;->a(Landroidx/fragment/app/w;Ljava/lang/ClassLoader;)Landroidx/fragment/app/n;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 14
    iput-object p5, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 15
    const-string p0, "arguments"

    invoke-virtual {p5, p0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 16
    invoke-virtual {p0, p3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 17
    :cond_0
    invoke-virtual {p1, p0}, Landroidx/fragment/app/n;->setArguments(Landroid/os/Bundle;)V

    const/4 p0, 0x2

    .line 18
    invoke-static {p0}, Landroidx/fragment/app/F;->J0(I)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 19
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Instantiated fragment "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "FragmentManager"

    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method private l(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :goto_0
    if-eqz p1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 16
    .line 17
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 18
    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const/4 p0, 0x0

    .line 28
    return p0
.end method


# virtual methods
.method a()V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "moveto ACTIVITY_CREATED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget-object v0, v0, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const-string v1, "savedInstanceState"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_0
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroidx/fragment/app/n;->performActivityCreated(Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 52
    .line 53
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-virtual {v1, p0, v0, v2}, Landroidx/fragment/app/z;->a(Landroidx/fragment/app/n;Landroid/os/Bundle;Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method b()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-static {v0}, Landroidx/fragment/app/F;->l0(Landroid/view/View;)Landroidx/fragment/app/n;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroidx/fragment/app/n;->getParentFragment()Landroidx/fragment/app/n;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/fragment/app/n;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 24
    .line 25
    iget v2, v1, Landroidx/fragment/app/n;->mContainerId:I

    .line 26
    .line 27
    invoke-static {v1, v0, v2}, LS/c;->o(Landroidx/fragment/app/n;Landroidx/fragment/app/n;I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 31
    .line 32
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/fragment/app/M;->j(Landroidx/fragment/app/n;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 39
    .line 40
    iget-object v1, p0, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 41
    .line 42
    iget-object p0, p0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method c()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "moveto ATTACHED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget-object v1, v0, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const-string v3, " that does not belong to this FragmentManager!"

    .line 38
    .line 39
    const-string v4, " declared target fragment "

    .line 40
    .line 41
    const-string v5, "Fragment "

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 46
    .line 47
    iget-object v1, v1, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/fragment/app/M;->n(Ljava/lang/String;)Landroidx/fragment/app/L;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 56
    .line 57
    iget-object v3, v1, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 58
    .line 59
    iget-object v3, v3, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v3, v1, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v2, v1, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 64
    .line 65
    move-object v2, v0

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 68
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 86
    .line 87
    iget-object p0, p0, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 88
    .line 89
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v0

    .line 103
    :cond_2
    iget-object v0, v0, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v0, :cond_4

    .line 106
    .line 107
    iget-object v1, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Landroidx/fragment/app/M;->n(Ljava/lang/String;)Landroidx/fragment/app/L;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 117
    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 135
    .line 136
    iget-object p0, p0, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw v0

    .line 152
    :cond_4
    :goto_0
    if-eqz v2, :cond_5

    .line 153
    .line 154
    invoke-virtual {v2}, Landroidx/fragment/app/L;->m()V

    .line 155
    .line 156
    .line 157
    :cond_5
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 158
    .line 159
    iget-object v1, v0, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 160
    .line 161
    invoke-virtual {v1}, Landroidx/fragment/app/F;->w0()Landroidx/fragment/app/x;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Landroidx/fragment/app/n;->mHost:Landroidx/fragment/app/x;

    .line 166
    .line 167
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 168
    .line 169
    iget-object v1, v0, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 170
    .line 171
    invoke-virtual {v1}, Landroidx/fragment/app/F;->z0()Landroidx/fragment/app/n;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    iput-object v1, v0, Landroidx/fragment/app/n;->mParentFragment:Landroidx/fragment/app/n;

    .line 176
    .line 177
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 178
    .line 179
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 180
    .line 181
    const/4 v2, 0x0

    .line 182
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/z;->g(Landroidx/fragment/app/n;Z)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 186
    .line 187
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performAttach()V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 191
    .line 192
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 193
    .line 194
    invoke-virtual {v0, p0, v2}, Landroidx/fragment/app/z;->b(Landroidx/fragment/app/n;Z)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method d()I
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget p0, v0, Landroidx/fragment/app/n;->mState:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget v1, p0, Landroidx/fragment/app/L;->e:I

    .line 11
    .line 12
    sget-object v2, Landroidx/fragment/app/L$b;->a:[I

    .line 13
    .line 14
    iget-object v0, v0, Landroidx/fragment/app/n;->mMaxState:Landroidx/lifecycle/g$b;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    aget v0, v2, v0

    .line 21
    .line 22
    const/4 v2, 0x5

    .line 23
    const/4 v3, -0x1

    .line 24
    const/4 v4, 0x3

    .line 25
    const/4 v5, 0x4

    .line 26
    const/4 v6, 0x2

    .line 27
    const/4 v7, 0x1

    .line 28
    if-eq v0, v7, :cond_4

    .line 29
    .line 30
    if-eq v0, v6, :cond_3

    .line 31
    .line 32
    if-eq v0, v4, :cond_2

    .line 33
    .line 34
    if-eq v0, v5, :cond_1

    .line 35
    .line 36
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_0

    .line 52
    :cond_3
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :cond_4
    :goto_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 57
    .line 58
    iget-boolean v8, v0, Landroidx/fragment/app/n;->mFromLayout:Z

    .line 59
    .line 60
    if-eqz v8, :cond_7

    .line 61
    .line 62
    iget-boolean v8, v0, Landroidx/fragment/app/n;->mInLayout:Z

    .line 63
    .line 64
    if-eqz v8, :cond_5

    .line 65
    .line 66
    iget v0, p0, Landroidx/fragment/app/L;->e:I

    .line 67
    .line 68
    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 73
    .line 74
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 75
    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-nez v0, :cond_7

    .line 83
    .line 84
    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_1

    .line 89
    :cond_5
    iget v8, p0, Landroidx/fragment/app/L;->e:I

    .line 90
    .line 91
    if-ge v8, v5, :cond_6

    .line 92
    .line 93
    iget v0, v0, Landroidx/fragment/app/n;->mState:I

    .line 94
    .line 95
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_1

    .line 100
    :cond_6
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    :cond_7
    :goto_1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 105
    .line 106
    iget-boolean v0, v0, Landroidx/fragment/app/n;->mAdded:Z

    .line 107
    .line 108
    if-nez v0, :cond_8

    .line 109
    .line 110
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    :cond_8
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 115
    .line 116
    iget-object v8, v0, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 117
    .line 118
    if-eqz v8, :cond_9

    .line 119
    .line 120
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getParentFragmentManager()Landroidx/fragment/app/F;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v8, v0}, Landroidx/fragment/app/W;->r(Landroid/view/ViewGroup;Landroidx/fragment/app/F;)Landroidx/fragment/app/W;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0, p0}, Landroidx/fragment/app/W;->p(Landroidx/fragment/app/L;)Landroidx/fragment/app/W$c$a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    goto :goto_2

    .line 133
    :cond_9
    const/4 v0, 0x0

    .line 134
    :goto_2
    sget-object v8, Landroidx/fragment/app/W$c$a;->h:Landroidx/fragment/app/W$c$a;

    .line 135
    .line 136
    if-ne v0, v8, :cond_a

    .line 137
    .line 138
    const/4 v0, 0x6

    .line 139
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    goto :goto_3

    .line 144
    :cond_a
    sget-object v8, Landroidx/fragment/app/W$c$a;->i:Landroidx/fragment/app/W$c$a;

    .line 145
    .line 146
    if-ne v0, v8, :cond_b

    .line 147
    .line 148
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    goto :goto_3

    .line 153
    :cond_b
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 154
    .line 155
    iget-boolean v4, v0, Landroidx/fragment/app/n;->mRemoving:Z

    .line 156
    .line 157
    if-eqz v4, :cond_d

    .line 158
    .line 159
    invoke-virtual {v0}, Landroidx/fragment/app/n;->isInBackStack()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_c

    .line 164
    .line 165
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    goto :goto_3

    .line 170
    :cond_c
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    :cond_d
    :goto_3
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 175
    .line 176
    iget-boolean v3, v0, Landroidx/fragment/app/n;->mDeferStart:Z

    .line 177
    .line 178
    if-eqz v3, :cond_e

    .line 179
    .line 180
    iget v0, v0, Landroidx/fragment/app/n;->mState:I

    .line 181
    .line 182
    if-ge v0, v2, :cond_e

    .line 183
    .line 184
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    :cond_e
    invoke-static {v6}, Landroidx/fragment/app/F;->J0(I)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_f

    .line 193
    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    const-string v2, "computeExpectedState() of "

    .line 200
    .line 201
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v2, " for "

    .line 208
    .line 209
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 213
    .line 214
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    const-string v0, "FragmentManager"

    .line 222
    .line 223
    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    :cond_f
    return v1
.end method

.method e()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "moveto CREATED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget-object v0, v0, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const-string v1, "savedInstanceState"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_0
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 47
    .line 48
    iget-boolean v2, v1, Landroidx/fragment/app/n;->mIsCreated:Z

    .line 49
    .line 50
    if-nez v2, :cond_2

    .line 51
    .line 52
    iget-object v2, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v2, v1, v0, v3}, Landroidx/fragment/app/z;->h(Landroidx/fragment/app/n;Landroid/os/Bundle;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroidx/fragment/app/n;->performCreate(Landroid/os/Bundle;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 64
    .line 65
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 66
    .line 67
    invoke-virtual {v1, p0, v0, v3}, Landroidx/fragment/app/z;->c(Landroidx/fragment/app/n;Landroid/os/Bundle;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    const/4 p0, 0x1

    .line 72
    iput p0, v1, Landroidx/fragment/app/n;->mState:I

    .line 73
    .line 74
    invoke-virtual {v1}, Landroidx/fragment/app/n;->restoreChildFragmentState()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method f()V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-boolean v0, v0, Landroidx/fragment/app/n;->mFromLayout:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x3

    .line 9
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "FragmentManager"

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "moveto CREATE_VIEW: "

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 40
    .line 41
    iget-object v1, v1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    const-string v4, "savedInstanceState"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-object v1, v3

    .line 54
    :goto_0
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 55
    .line 56
    invoke-virtual {v4, v1}, Landroidx/fragment/app/n;->performGetLayoutInflater(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 61
    .line 62
    iget-object v6, v5, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 63
    .line 64
    if-eqz v6, :cond_3

    .line 65
    .line 66
    move-object v3, v6

    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_3
    iget v6, v5, Landroidx/fragment/app/n;->mContainerId:I

    .line 70
    .line 71
    if-eqz v6, :cond_7

    .line 72
    .line 73
    const/4 v3, -0x1

    .line 74
    if-eq v6, v3, :cond_6

    .line 75
    .line 76
    iget-object v3, v5, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 77
    .line 78
    invoke-virtual {v3}, Landroidx/fragment/app/F;->s0()Landroidx/fragment/app/u;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 83
    .line 84
    iget v5, v5, Landroidx/fragment/app/n;->mContainerId:I

    .line 85
    .line 86
    invoke-virtual {v3, v5}, Landroidx/fragment/app/u;->c(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Landroid/view/ViewGroup;

    .line 91
    .line 92
    if-nez v3, :cond_5

    .line 93
    .line 94
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 95
    .line 96
    iget-boolean v6, v5, Landroidx/fragment/app/n;->mRestored:Z

    .line 97
    .line 98
    if-eqz v6, :cond_4

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    :try_start_0
    invoke-virtual {v5}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 106
    .line 107
    iget v1, v1, Landroidx/fragment/app/n;->mContainerId:I

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    goto :goto_1

    .line 114
    :catch_0
    const-string v0, "unknown"

    .line 115
    .line 116
    :goto_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 117
    .line 118
    new-instance v2, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v3, "No view found for id 0x"

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 129
    .line 130
    iget v3, v3, Landroidx/fragment/app/n;->mContainerId:I

    .line 131
    .line 132
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v3, " ("

    .line 140
    .line 141
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v0, ") for fragment "

    .line 148
    .line 149
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 153
    .line 154
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw v1

    .line 165
    :cond_5
    instance-of v5, v3, Landroidx/fragment/app/FragmentContainerView;

    .line 166
    .line 167
    if-nez v5, :cond_7

    .line 168
    .line 169
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 170
    .line 171
    invoke-static {v5, v3}, LS/c;->n(Landroidx/fragment/app/n;Landroid/view/ViewGroup;)V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 176
    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    const-string v2, "Cannot create fragment "

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 188
    .line 189
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string p0, " for a container view with no id"

    .line 193
    .line 194
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    throw v0

    .line 205
    :cond_7
    :goto_2
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 206
    .line 207
    iput-object v3, v5, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 208
    .line 209
    invoke-virtual {v5, v4, v3, v1}, Landroidx/fragment/app/n;->performCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 210
    .line 211
    .line 212
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 213
    .line 214
    iget-object v4, v4, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 215
    .line 216
    const/4 v5, 0x2

    .line 217
    if-eqz v4, :cond_d

    .line 218
    .line 219
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_8

    .line 224
    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string v4, "moveto VIEW_CREATED: "

    .line 231
    .line 232
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 236
    .line 237
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    :cond_8
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 248
    .line 249
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 250
    .line 251
    const/4 v4, 0x0

    .line 252
    invoke-virtual {v0, v4}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 256
    .line 257
    iget-object v6, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 258
    .line 259
    sget v7, LR/b;->a:I

    .line 260
    .line 261
    invoke-virtual {v6, v7, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    if-eqz v3, :cond_9

    .line 265
    .line 266
    invoke-virtual {p0}, Landroidx/fragment/app/L;->b()V

    .line 267
    .line 268
    .line 269
    :cond_9
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 270
    .line 271
    iget-boolean v3, v0, Landroidx/fragment/app/n;->mHidden:Z

    .line 272
    .line 273
    if-eqz v3, :cond_a

    .line 274
    .line 275
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 276
    .line 277
    const/16 v3, 0x8

    .line 278
    .line 279
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 280
    .line 281
    .line 282
    :cond_a
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 283
    .line 284
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 285
    .line 286
    invoke-static {v0}, LJ/I;->N(Landroid/view/View;)Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-eqz v0, :cond_b

    .line 291
    .line 292
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 293
    .line 294
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 295
    .line 296
    invoke-static {v0}, LJ/I;->f0(Landroid/view/View;)V

    .line 297
    .line 298
    .line 299
    goto :goto_3

    .line 300
    :cond_b
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 301
    .line 302
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 303
    .line 304
    new-instance v3, Landroidx/fragment/app/L$a;

    .line 305
    .line 306
    invoke-direct {v3, p0, v0}, Landroidx/fragment/app/L$a;-><init>(Landroidx/fragment/app/L;Landroid/view/View;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v0, v3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 310
    .line 311
    .line 312
    :goto_3
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 313
    .line 314
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performViewCreated()V

    .line 315
    .line 316
    .line 317
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 318
    .line 319
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 320
    .line 321
    iget-object v6, v3, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 322
    .line 323
    invoke-virtual {v0, v3, v6, v1, v4}, Landroidx/fragment/app/z;->m(Landroidx/fragment/app/n;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 324
    .line 325
    .line 326
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 327
    .line 328
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 329
    .line 330
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 335
    .line 336
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 337
    .line 338
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 343
    .line 344
    invoke-virtual {v3, v1}, Landroidx/fragment/app/n;->setPostOnViewCreatedAlpha(F)V

    .line 345
    .line 346
    .line 347
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 348
    .line 349
    iget-object v3, v1, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 350
    .line 351
    if-eqz v3, :cond_d

    .line 352
    .line 353
    if-nez v0, :cond_d

    .line 354
    .line 355
    iget-object v0, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 356
    .line 357
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    if-eqz v0, :cond_c

    .line 362
    .line 363
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 364
    .line 365
    invoke-virtual {v1, v0}, Landroidx/fragment/app/n;->setFocusedView(Landroid/view/View;)V

    .line 366
    .line 367
    .line 368
    invoke-static {v5}, Landroidx/fragment/app/F;->J0(I)Z

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    if-eqz v1, :cond_c

    .line 373
    .line 374
    new-instance v1, Ljava/lang/StringBuilder;

    .line 375
    .line 376
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 377
    .line 378
    .line 379
    const-string v3, "requestFocus: Saved focused view "

    .line 380
    .line 381
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v0, " for Fragment "

    .line 388
    .line 389
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 393
    .line 394
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    :cond_c
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 405
    .line 406
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 407
    .line 408
    const/4 v1, 0x0

    .line 409
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 410
    .line 411
    .line 412
    :cond_d
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 413
    .line 414
    iput v5, p0, Landroidx/fragment/app/n;->mState:I

    .line 415
    .line 416
    return-void
.end method

.method g()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "movefrom CREATED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget-boolean v1, v0, Landroidx/fragment/app/n;->mRemoving:Z

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    const/4 v3, 0x0

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0}, Landroidx/fragment/app/n;->isInBackStack()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    move v0, v2

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v0, v3

    .line 49
    :goto_0
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 53
    .line 54
    iget-boolean v5, v4, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 55
    .line 56
    if-nez v5, :cond_2

    .line 57
    .line 58
    iget-object v5, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 59
    .line 60
    iget-object v4, v4, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v5, v4, v1}, Landroidx/fragment/app/M;->B(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 63
    .line 64
    .line 65
    :cond_2
    if-nez v0, :cond_5

    .line 66
    .line 67
    iget-object v4, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 68
    .line 69
    invoke-virtual {v4}, Landroidx/fragment/app/M;->p()Landroidx/fragment/app/I;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 74
    .line 75
    invoke-virtual {v4, v5}, Landroidx/fragment/app/I;->q(Landroidx/fragment/app/n;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_3

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 83
    .line 84
    iget-object v0, v0, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    iget-object v1, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroidx/fragment/app/M;->f(Ljava/lang/String;)Landroidx/fragment/app/n;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    iget-boolean v1, v0, Landroidx/fragment/app/n;->mRetainInstance:Z

    .line 97
    .line 98
    if-eqz v1, :cond_4

    .line 99
    .line 100
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 101
    .line 102
    iput-object v0, v1, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 103
    .line 104
    :cond_4
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 105
    .line 106
    iput v3, p0, Landroidx/fragment/app/n;->mState:I

    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    :goto_1
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 110
    .line 111
    iget-object v4, v4, Landroidx/fragment/app/n;->mHost:Landroidx/fragment/app/x;

    .line 112
    .line 113
    instance-of v5, v4, LW/p;

    .line 114
    .line 115
    if-eqz v5, :cond_6

    .line 116
    .line 117
    iget-object v2, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 118
    .line 119
    invoke-virtual {v2}, Landroidx/fragment/app/M;->p()Landroidx/fragment/app/I;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Landroidx/fragment/app/I;->n()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    goto :goto_2

    .line 128
    :cond_6
    invoke-virtual {v4}, Landroidx/fragment/app/x;->h()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    instance-of v5, v5, Landroid/app/Activity;

    .line 133
    .line 134
    if-eqz v5, :cond_7

    .line 135
    .line 136
    invoke-virtual {v4}, Landroidx/fragment/app/x;->h()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    check-cast v4, Landroid/app/Activity;

    .line 141
    .line 142
    invoke-virtual {v4}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    xor-int/2addr v2, v4

    .line 147
    :cond_7
    :goto_2
    if-eqz v0, :cond_8

    .line 148
    .line 149
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 150
    .line 151
    iget-boolean v0, v0, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 152
    .line 153
    if-eqz v0, :cond_9

    .line 154
    .line 155
    :cond_8
    if-eqz v2, :cond_a

    .line 156
    .line 157
    :cond_9
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroidx/fragment/app/M;->p()Landroidx/fragment/app/I;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 164
    .line 165
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/I;->f(Landroidx/fragment/app/n;Z)V

    .line 166
    .line 167
    .line 168
    :cond_a
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 169
    .line 170
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performDestroy()V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 174
    .line 175
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 176
    .line 177
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/z;->d(Landroidx/fragment/app/n;Z)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 181
    .line 182
    invoke-virtual {v0}, Landroidx/fragment/app/M;->k()Ljava/util/List;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    :cond_b
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-eqz v2, :cond_c

    .line 195
    .line 196
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Landroidx/fragment/app/L;

    .line 201
    .line 202
    if-eqz v2, :cond_b

    .line 203
    .line 204
    invoke-virtual {v2}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 209
    .line 210
    iget-object v3, v3, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 211
    .line 212
    iget-object v4, v2, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    if-eqz v3, :cond_b

    .line 219
    .line 220
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 221
    .line 222
    iput-object v3, v2, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 223
    .line 224
    iput-object v1, v2, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_c
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 228
    .line 229
    iget-object v1, v0, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 230
    .line 231
    if-eqz v1, :cond_d

    .line 232
    .line 233
    iget-object v2, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 234
    .line 235
    invoke-virtual {v2, v1}, Landroidx/fragment/app/M;->f(Ljava/lang/String;)Landroidx/fragment/app/n;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v0, Landroidx/fragment/app/n;->mTarget:Landroidx/fragment/app/n;

    .line 240
    .line 241
    :cond_d
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 242
    .line 243
    invoke-virtual {v0, p0}, Landroidx/fragment/app/M;->s(Landroidx/fragment/app/L;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method h()V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "movefrom CREATE_VIEW: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget-object v1, v0, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performDestroyView()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 51
    .line 52
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/z;->n(Landroidx/fragment/app/n;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    iput-object v1, v0, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 62
    .line 63
    iput-object v1, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 64
    .line 65
    iput-object v1, v0, Landroidx/fragment/app/n;->mViewLifecycleOwner:Landroidx/fragment/app/S;

    .line 66
    .line 67
    iget-object v0, v0, Landroidx/fragment/app/n;->mViewLifecycleOwnerLiveData:LW/h;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, LW/h;->i(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 73
    .line 74
    iput-boolean v2, p0, Landroidx/fragment/app/n;->mInLayout:Z

    .line 75
    .line 76
    return-void
.end method

.method i()V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const-string v2, "FragmentManager"

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v3, "movefrom ATTACHED: "

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroidx/fragment/app/n;->performDetach()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 38
    .line 39
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-virtual {v1, v3, v4}, Landroidx/fragment/app/z;->e(Landroidx/fragment/app/n;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 46
    .line 47
    const/4 v3, -0x1

    .line 48
    iput v3, v1, Landroidx/fragment/app/n;->mState:I

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    iput-object v3, v1, Landroidx/fragment/app/n;->mHost:Landroidx/fragment/app/x;

    .line 52
    .line 53
    iput-object v3, v1, Landroidx/fragment/app/n;->mParentFragment:Landroidx/fragment/app/n;

    .line 54
    .line 55
    iput-object v3, v1, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 56
    .line 57
    iget-boolean v3, v1, Landroidx/fragment/app/n;->mRemoving:Z

    .line 58
    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Landroidx/fragment/app/n;->isInBackStack()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object v1, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 69
    .line 70
    invoke-virtual {v1}, Landroidx/fragment/app/M;->p()Landroidx/fragment/app/I;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroidx/fragment/app/I;->q(Landroidx/fragment/app/n;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    :goto_0
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v1, "initState called for fragment: "

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroidx/fragment/app/n;->initState()V

    .line 113
    .line 114
    .line 115
    :cond_3
    return-void
.end method

.method j()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-boolean v1, v0, Landroidx/fragment/app/n;->mFromLayout:Z

    .line 4
    .line 5
    if-eqz v1, :cond_3

    .line 6
    .line 7
    iget-boolean v1, v0, Landroidx/fragment/app/n;->mInLayout:Z

    .line 8
    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    iget-boolean v0, v0, Landroidx/fragment/app/n;->mPerformedCreateView:Z

    .line 12
    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "moveto CREATE_VIEW: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "FragmentManager"

    .line 42
    .line 43
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 47
    .line 48
    iget-object v0, v0, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    const-string v2, "savedInstanceState"

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    move-object v0, v1

    .line 61
    :goto_0
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Landroidx/fragment/app/n;->performGetLayoutInflater(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v3, v1, v0}, Landroidx/fragment/app/n;->performCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 71
    .line 72
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-virtual {v1, v2}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 81
    .line 82
    iget-object v3, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 83
    .line 84
    sget v4, LR/b;->a:I

    .line 85
    .line 86
    invoke-virtual {v3, v4, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 90
    .line 91
    iget-boolean v3, v1, Landroidx/fragment/app/n;->mHidden:Z

    .line 92
    .line 93
    if-eqz v3, :cond_2

    .line 94
    .line 95
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 96
    .line 97
    const/16 v3, 0x8

    .line 98
    .line 99
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 103
    .line 104
    invoke-virtual {v1}, Landroidx/fragment/app/n;->performViewCreated()V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 108
    .line 109
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 110
    .line 111
    iget-object v4, v3, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 112
    .line 113
    invoke-virtual {v1, v3, v4, v0, v2}, Landroidx/fragment/app/z;->m(Landroidx/fragment/app/n;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 117
    .line 118
    const/4 v0, 0x2

    .line 119
    iput v0, p0, Landroidx/fragment/app/n;->mState:I

    .line 120
    .line 121
    :cond_3
    return-void
.end method

.method k()Landroidx/fragment/app/n;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    return-object p0
.end method

.method m()V
    .locals 9

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "FragmentManager"

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-static {v1}, Landroidx/fragment/app/F;->J0(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "Ignoring re-entrant call to moveToExpectedState() for "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v2, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    const/4 v3, 0x1

    .line 41
    :try_start_0
    iput-boolean v3, p0, Landroidx/fragment/app/L;->d:Z

    .line 42
    .line 43
    move v4, v0

    .line 44
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/L;->d()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    iget-object v6, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 49
    .line 50
    iget v7, v6, Landroidx/fragment/app/n;->mState:I

    .line 51
    .line 52
    const/4 v8, 0x3

    .line 53
    if-eq v5, v7, :cond_9

    .line 54
    .line 55
    if-le v5, v7, :cond_3

    .line 56
    .line 57
    add-int/lit8 v7, v7, 0x1

    .line 58
    .line 59
    packed-switch v7, :pswitch_data_0

    .line 60
    .line 61
    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :pswitch_0
    invoke-virtual {p0}, Landroidx/fragment/app/L;->p()V

    .line 65
    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :catchall_0
    move-exception v1

    .line 70
    goto/16 :goto_4

    .line 71
    .line 72
    :pswitch_1
    const/4 v4, 0x6

    .line 73
    iput v4, v6, Landroidx/fragment/app/n;->mState:I

    .line 74
    .line 75
    goto/16 :goto_2

    .line 76
    .line 77
    :pswitch_2
    invoke-virtual {p0}, Landroidx/fragment/app/L;->t()V

    .line 78
    .line 79
    .line 80
    goto/16 :goto_2

    .line 81
    .line 82
    :pswitch_3
    iget-object v4, v6, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    iget-object v4, v6, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 87
    .line 88
    if-eqz v4, :cond_2

    .line 89
    .line 90
    invoke-virtual {v6}, Landroidx/fragment/app/n;->getParentFragmentManager()Landroidx/fragment/app/F;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-static {v4, v5}, Landroidx/fragment/app/W;->r(Landroid/view/ViewGroup;Landroidx/fragment/app/F;)Landroidx/fragment/app/W;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 99
    .line 100
    iget-object v5, v5, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 101
    .line 102
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    invoke-static {v5}, Landroidx/fragment/app/W$c$b;->d(I)Landroidx/fragment/app/W$c$b;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v4, v5, p0}, Landroidx/fragment/app/W;->f(Landroidx/fragment/app/W$c$b;Landroidx/fragment/app/L;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 114
    .line 115
    const/4 v5, 0x4

    .line 116
    iput v5, v4, Landroidx/fragment/app/n;->mState:I

    .line 117
    .line 118
    goto/16 :goto_2

    .line 119
    .line 120
    :pswitch_4
    invoke-virtual {p0}, Landroidx/fragment/app/L;->a()V

    .line 121
    .line 122
    .line 123
    goto/16 :goto_2

    .line 124
    .line 125
    :pswitch_5
    invoke-virtual {p0}, Landroidx/fragment/app/L;->j()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Landroidx/fragment/app/L;->f()V

    .line 129
    .line 130
    .line 131
    goto/16 :goto_2

    .line 132
    .line 133
    :pswitch_6
    invoke-virtual {p0}, Landroidx/fragment/app/L;->e()V

    .line 134
    .line 135
    .line 136
    goto/16 :goto_2

    .line 137
    .line 138
    :pswitch_7
    invoke-virtual {p0}, Landroidx/fragment/app/L;->c()V

    .line 139
    .line 140
    .line 141
    goto/16 :goto_2

    .line 142
    .line 143
    :cond_3
    add-int/lit8 v7, v7, -0x1

    .line 144
    .line 145
    packed-switch v7, :pswitch_data_1

    .line 146
    .line 147
    .line 148
    goto/16 :goto_2

    .line 149
    .line 150
    :pswitch_8
    invoke-virtual {p0}, Landroidx/fragment/app/L;->n()V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_2

    .line 154
    .line 155
    :pswitch_9
    const/4 v4, 0x5

    .line 156
    iput v4, v6, Landroidx/fragment/app/n;->mState:I

    .line 157
    .line 158
    goto/16 :goto_2

    .line 159
    .line 160
    :pswitch_a
    invoke-virtual {p0}, Landroidx/fragment/app/L;->u()V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_2

    .line 164
    .line 165
    :pswitch_b
    invoke-static {v8}, Landroidx/fragment/app/F;->J0(I)Z

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    if-eqz v4, :cond_4

    .line 170
    .line 171
    new-instance v4, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v5, "movefrom ACTIVITY_CREATED: "

    .line 177
    .line 178
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 182
    .line 183
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    :cond_4
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 194
    .line 195
    iget-boolean v5, v4, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 196
    .line 197
    if-eqz v5, :cond_5

    .line 198
    .line 199
    iget-object v5, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 200
    .line 201
    iget-object v4, v4, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {p0}, Landroidx/fragment/app/L;->q()Landroid/os/Bundle;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    invoke-virtual {v5, v4, v6}, Landroidx/fragment/app/M;->B(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_5
    iget-object v5, v4, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 212
    .line 213
    if-eqz v5, :cond_6

    .line 214
    .line 215
    iget-object v4, v4, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 216
    .line 217
    if-nez v4, :cond_6

    .line 218
    .line 219
    invoke-virtual {p0}, Landroidx/fragment/app/L;->r()V

    .line 220
    .line 221
    .line 222
    :cond_6
    :goto_1
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 223
    .line 224
    iget-object v5, v4, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 225
    .line 226
    if-eqz v5, :cond_7

    .line 227
    .line 228
    iget-object v5, v4, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 229
    .line 230
    if-eqz v5, :cond_7

    .line 231
    .line 232
    invoke-virtual {v4}, Landroidx/fragment/app/n;->getParentFragmentManager()Landroidx/fragment/app/F;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-static {v5, v4}, Landroidx/fragment/app/W;->r(Landroid/view/ViewGroup;Landroidx/fragment/app/F;)Landroidx/fragment/app/W;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    invoke-virtual {v4, p0}, Landroidx/fragment/app/W;->h(Landroidx/fragment/app/L;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 244
    .line 245
    iput v8, v4, Landroidx/fragment/app/n;->mState:I

    .line 246
    .line 247
    goto :goto_2

    .line 248
    :pswitch_c
    iput-boolean v0, v6, Landroidx/fragment/app/n;->mInLayout:Z

    .line 249
    .line 250
    iput v1, v6, Landroidx/fragment/app/n;->mState:I

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :pswitch_d
    invoke-virtual {p0}, Landroidx/fragment/app/L;->h()V

    .line 254
    .line 255
    .line 256
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 257
    .line 258
    iput v3, v4, Landroidx/fragment/app/n;->mState:I

    .line 259
    .line 260
    goto :goto_2

    .line 261
    :pswitch_e
    iget-boolean v4, v6, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 262
    .line 263
    if-eqz v4, :cond_8

    .line 264
    .line 265
    iget-object v4, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 266
    .line 267
    iget-object v5, v6, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v4, v5}, Landroidx/fragment/app/M;->q(Ljava/lang/String;)Landroid/os/Bundle;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    if-nez v4, :cond_8

    .line 274
    .line 275
    iget-object v4, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 276
    .line 277
    iget-object v5, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 278
    .line 279
    iget-object v5, v5, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {p0}, Landroidx/fragment/app/L;->q()Landroid/os/Bundle;

    .line 282
    .line 283
    .line 284
    move-result-object v6

    .line 285
    invoke-virtual {v4, v5, v6}, Landroidx/fragment/app/M;->B(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 286
    .line 287
    .line 288
    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/L;->g()V

    .line 289
    .line 290
    .line 291
    goto :goto_2

    .line 292
    :pswitch_f
    invoke-virtual {p0}, Landroidx/fragment/app/L;->i()V

    .line 293
    .line 294
    .line 295
    :goto_2
    move v4, v3

    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :cond_9
    if-nez v4, :cond_c

    .line 299
    .line 300
    const/4 v1, -0x1

    .line 301
    if-ne v7, v1, :cond_c

    .line 302
    .line 303
    iget-boolean v1, v6, Landroidx/fragment/app/n;->mRemoving:Z

    .line 304
    .line 305
    if-eqz v1, :cond_c

    .line 306
    .line 307
    invoke-virtual {v6}, Landroidx/fragment/app/n;->isInBackStack()Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-nez v1, :cond_c

    .line 312
    .line 313
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 314
    .line 315
    iget-boolean v1, v1, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 316
    .line 317
    if-nez v1, :cond_c

    .line 318
    .line 319
    invoke-static {v8}, Landroidx/fragment/app/F;->J0(I)Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-eqz v1, :cond_a

    .line 324
    .line 325
    new-instance v1, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .line 329
    .line 330
    const-string v4, "Cleaning up state of never attached fragment: "

    .line 331
    .line 332
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 336
    .line 337
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    .line 346
    .line 347
    :cond_a
    iget-object v1, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 348
    .line 349
    invoke-virtual {v1}, Landroidx/fragment/app/M;->p()Landroidx/fragment/app/I;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    iget-object v4, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 354
    .line 355
    invoke-virtual {v1, v4, v3}, Landroidx/fragment/app/I;->f(Landroidx/fragment/app/n;Z)V

    .line 356
    .line 357
    .line 358
    iget-object v1, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 359
    .line 360
    invoke-virtual {v1, p0}, Landroidx/fragment/app/M;->s(Landroidx/fragment/app/L;)V

    .line 361
    .line 362
    .line 363
    invoke-static {v8}, Landroidx/fragment/app/F;->J0(I)Z

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    if-eqz v1, :cond_b

    .line 368
    .line 369
    new-instance v1, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 372
    .line 373
    .line 374
    const-string v3, "initState called for fragment: "

    .line 375
    .line 376
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 380
    .line 381
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    .line 390
    .line 391
    :cond_b
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 392
    .line 393
    invoke-virtual {v1}, Landroidx/fragment/app/n;->initState()V

    .line 394
    .line 395
    .line 396
    :cond_c
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 397
    .line 398
    iget-boolean v2, v1, Landroidx/fragment/app/n;->mHiddenChanged:Z

    .line 399
    .line 400
    if-eqz v2, :cond_10

    .line 401
    .line 402
    iget-object v2, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 403
    .line 404
    if-eqz v2, :cond_e

    .line 405
    .line 406
    iget-object v2, v1, Landroidx/fragment/app/n;->mContainer:Landroid/view/ViewGroup;

    .line 407
    .line 408
    if-eqz v2, :cond_e

    .line 409
    .line 410
    invoke-virtual {v1}, Landroidx/fragment/app/n;->getParentFragmentManager()Landroidx/fragment/app/F;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-static {v2, v1}, Landroidx/fragment/app/W;->r(Landroid/view/ViewGroup;Landroidx/fragment/app/F;)Landroidx/fragment/app/W;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 419
    .line 420
    iget-boolean v2, v2, Landroidx/fragment/app/n;->mHidden:Z

    .line 421
    .line 422
    if-eqz v2, :cond_d

    .line 423
    .line 424
    invoke-virtual {v1, p0}, Landroidx/fragment/app/W;->g(Landroidx/fragment/app/L;)V

    .line 425
    .line 426
    .line 427
    goto :goto_3

    .line 428
    :cond_d
    invoke-virtual {v1, p0}, Landroidx/fragment/app/W;->i(Landroidx/fragment/app/L;)V

    .line 429
    .line 430
    .line 431
    :cond_e
    :goto_3
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 432
    .line 433
    iget-object v2, v1, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 434
    .line 435
    if-eqz v2, :cond_f

    .line 436
    .line 437
    invoke-virtual {v2, v1}, Landroidx/fragment/app/F;->H0(Landroidx/fragment/app/n;)V

    .line 438
    .line 439
    .line 440
    :cond_f
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 441
    .line 442
    iput-boolean v0, v1, Landroidx/fragment/app/n;->mHiddenChanged:Z

    .line 443
    .line 444
    iget-boolean v2, v1, Landroidx/fragment/app/n;->mHidden:Z

    .line 445
    .line 446
    invoke-virtual {v1, v2}, Landroidx/fragment/app/n;->onHiddenChanged(Z)V

    .line 447
    .line 448
    .line 449
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 450
    .line 451
    iget-object v1, v1, Landroidx/fragment/app/n;->mChildFragmentManager:Landroidx/fragment/app/F;

    .line 452
    .line 453
    invoke-virtual {v1}, Landroidx/fragment/app/F;->I()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    .line 455
    .line 456
    :cond_10
    iput-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    .line 457
    .line 458
    return-void

    .line 459
    :goto_4
    iput-boolean v0, p0, Landroidx/fragment/app/L;->d:Z

    .line 460
    .line 461
    throw v1

    .line 462
    nop

    .line 463
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method n()V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "movefrom RESUMED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performPause()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 38
    .line 39
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/z;->f(Landroidx/fragment/app/n;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method o(Ljava/lang/ClassLoader;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 12
    .line 13
    iget-object p1, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 14
    .line 15
    const-string v0, "savedInstanceState"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 24
    .line 25
    iget-object p1, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 26
    .line 27
    new-instance v1, Landroid/os/Bundle;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 36
    .line 37
    iget-object v0, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 38
    .line 39
    const-string v1, "viewState"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p1, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 46
    .line 47
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 48
    .line 49
    iget-object v0, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 50
    .line 51
    const-string v1, "viewRegistryState"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p1, Landroidx/fragment/app/n;->mSavedViewRegistryState:Landroid/os/Bundle;

    .line 58
    .line 59
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 60
    .line 61
    iget-object p1, p1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 62
    .line 63
    const-string v0, "state"

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Landroidx/fragment/app/K;

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 74
    .line 75
    iget-object v1, p1, Landroidx/fragment/app/K;->r:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v1, v0, Landroidx/fragment/app/n;->mTargetWho:Ljava/lang/String;

    .line 78
    .line 79
    iget v1, p1, Landroidx/fragment/app/K;->s:I

    .line 80
    .line 81
    iput v1, v0, Landroidx/fragment/app/n;->mTargetRequestCode:I

    .line 82
    .line 83
    iget-object v1, v0, Landroidx/fragment/app/n;->mSavedUserVisibleHint:Ljava/lang/Boolean;

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iput-boolean p1, v0, Landroidx/fragment/app/n;->mUserVisibleHint:Z

    .line 92
    .line 93
    iget-object p1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 94
    .line 95
    const/4 v0, 0x0

    .line 96
    iput-object v0, p1, Landroidx/fragment/app/n;->mSavedUserVisibleHint:Ljava/lang/Boolean;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    iget-boolean p1, p1, Landroidx/fragment/app/K;->t:Z

    .line 100
    .line 101
    iput-boolean p1, v0, Landroidx/fragment/app/n;->mUserVisibleHint:Z

    .line 102
    .line 103
    :cond_3
    :goto_0
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 104
    .line 105
    iget-boolean p1, p0, Landroidx/fragment/app/n;->mUserVisibleHint:Z

    .line 106
    .line 107
    if-nez p1, :cond_4

    .line 108
    .line 109
    const/4 p1, 0x1

    .line 110
    iput-boolean p1, p0, Landroidx/fragment/app/n;->mDeferStart:Z

    .line 111
    .line 112
    :cond_4
    :goto_1
    return-void
.end method

.method p()V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const-string v1, "FragmentManager"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "moveto RESUMED: "

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getFocusedView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-direct {p0, v0}, Landroidx/fragment/app/L;->l(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    const/4 v3, 0x2

    .line 51
    invoke-static {v3}, Landroidx/fragment/app/F;->J0(I)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v4, "requestFocus: Restoring focused view "

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, " "

    .line 71
    .line 72
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    if-eqz v2, :cond_1

    .line 76
    .line 77
    const-string v0, "succeeded"

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const-string v0, "failed"

    .line 81
    .line 82
    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v0, " on Fragment "

    .line 86
    .line 87
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 91
    .line 92
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, " resulting in focused view "

    .line 96
    .line 97
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 101
    .line 102
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    invoke-virtual {v0, v1}, Landroidx/fragment/app/n;->setFocusedView(Landroid/view/View;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performResume()V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 130
    .line 131
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 132
    .line 133
    const/4 v3, 0x0

    .line 134
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/z;->i(Landroidx/fragment/app/n;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Landroidx/fragment/app/L;->b:Landroidx/fragment/app/M;

    .line 138
    .line 139
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 140
    .line 141
    iget-object v2, v2, Landroidx/fragment/app/n;->mWho:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/M;->B(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 147
    .line 148
    iput-object v1, p0, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 149
    .line 150
    iput-object v1, p0, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 151
    .line 152
    iput-object v1, p0, Landroidx/fragment/app/n;->mSavedViewRegistryState:Landroid/os/Bundle;

    .line 153
    .line 154
    return-void
.end method

.method q()Landroid/os/Bundle;
    .locals 5

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 7
    .line 8
    iget v2, v1, Landroidx/fragment/app/n;->mState:I

    .line 9
    .line 10
    const/4 v3, -0x1

    .line 11
    if-ne v2, v3, :cond_0

    .line 12
    .line 13
    iget-object v1, v1, Landroidx/fragment/app/n;->mSavedFragmentState:Landroid/os/Bundle;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    new-instance v1, Landroidx/fragment/app/K;

    .line 21
    .line 22
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 23
    .line 24
    invoke-direct {v1, v2}, Landroidx/fragment/app/K;-><init>(Landroidx/fragment/app/n;)V

    .line 25
    .line 26
    .line 27
    const-string v2, "state"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    iget v1, v1, Landroidx/fragment/app/n;->mState:I

    .line 35
    .line 36
    if-le v1, v3, :cond_6

    .line 37
    .line 38
    new-instance v1, Landroid/os/Bundle;

    .line 39
    .line 40
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 44
    .line 45
    invoke-virtual {v2, v1}, Landroidx/fragment/app/n;->performSaveInstanceState(Landroid/os/Bundle;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/os/Bundle;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_1

    .line 53
    .line 54
    const-string v2, "savedInstanceState"

    .line 55
    .line 56
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v2, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 60
    .line 61
    iget-object v3, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    invoke-virtual {v2, v3, v1, v4}, Landroidx/fragment/app/z;->j(Landroidx/fragment/app/n;Landroid/os/Bundle;Z)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Landroid/os/Bundle;

    .line 68
    .line 69
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 73
    .line 74
    iget-object v2, v2, Landroidx/fragment/app/n;->mSavedStateRegistryController:Le0/e;

    .line 75
    .line 76
    invoke-virtual {v2, v1}, Le0/e;->e(Landroid/os/Bundle;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/os/Bundle;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_2

    .line 84
    .line 85
    const-string v2, "registryState"

    .line 86
    .line 87
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 91
    .line 92
    iget-object v1, v1, Landroidx/fragment/app/n;->mChildFragmentManager:Landroidx/fragment/app/F;

    .line 93
    .line 94
    invoke-virtual {v1}, Landroidx/fragment/app/F;->k1()Landroid/os/Bundle;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Landroid/os/Bundle;->isEmpty()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_3

    .line 103
    .line 104
    const-string v2, "childFragmentManager"

    .line 105
    .line 106
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 110
    .line 111
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 112
    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    invoke-virtual {p0}, Landroidx/fragment/app/L;->r()V

    .line 116
    .line 117
    .line 118
    :cond_4
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 119
    .line 120
    iget-object v1, v1, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 121
    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    const-string v2, "viewState"

    .line 125
    .line 126
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 130
    .line 131
    iget-object v1, v1, Landroidx/fragment/app/n;->mSavedViewRegistryState:Landroid/os/Bundle;

    .line 132
    .line 133
    if-eqz v1, :cond_6

    .line 134
    .line 135
    const-string v2, "viewRegistryState"

    .line 136
    .line 137
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 141
    .line 142
    iget-object p0, p0, Landroidx/fragment/app/n;->mArguments:Landroid/os/Bundle;

    .line 143
    .line 144
    if-eqz p0, :cond_7

    .line 145
    .line 146
    const-string v1, "arguments"

    .line 147
    .line 148
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 149
    .line 150
    .line 151
    :cond_7
    return-object v0
.end method

.method r()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "Saving view state for fragment "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " with view "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 36
    .line 37
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "FragmentManager"

    .line 47
    .line 48
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    :cond_1
    new-instance v0, Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 57
    .line 58
    iget-object v1, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-lez v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 70
    .line 71
    iput-object v0, v1, Landroidx/fragment/app/n;->mSavedViewState:Landroid/util/SparseArray;

    .line 72
    .line 73
    :cond_2
    new-instance v0, Landroid/os/Bundle;

    .line 74
    .line 75
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 79
    .line 80
    iget-object v1, v1, Landroidx/fragment/app/n;->mViewLifecycleOwner:Landroidx/fragment/app/S;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroidx/fragment/app/S;->f(Landroid/os/Bundle;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_3

    .line 90
    .line 91
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 92
    .line 93
    iput-object v0, p0, Landroidx/fragment/app/n;->mSavedViewRegistryState:Landroid/os/Bundle;

    .line 94
    .line 95
    :cond_3
    :goto_0
    return-void
.end method

.method s(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/fragment/app/L;->e:I

    .line 2
    .line 3
    return-void
.end method

.method t()V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "moveto STARTED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performStart()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 38
    .line 39
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/z;->k(Landroidx/fragment/app/n;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method u()V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "movefrom STARTED: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "FragmentManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroidx/fragment/app/n;->performStop()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Landroidx/fragment/app/L;->a:Landroidx/fragment/app/z;

    .line 38
    .line 39
    iget-object p0, p0, Landroidx/fragment/app/L;->c:Landroidx/fragment/app/n;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/z;->l(Landroidx/fragment/app/n;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
