.class public abstract Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "PreferenceFragmentCompat.java"


# instance fields
.field private p:Landroidx/recyclerview/widget/RecyclerView;

.field private q:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 1
    const-string v0, "XPG#PrefFragmentCompat"

    .line 2
    .line 3
    const-string v1, "onCreateView in."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1, p2, p3}, Landroidx/preference/PreferenceFragmentCompat;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->p()Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragmentCompat;->B(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-wide/16 v0, 0x0

    .line 29
    .line 30
    invoke-virtual {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->setRemoveDuration(J)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Landroidx/recyclerview/widget/s;

    .line 67
    .line 68
    const/4 p2, 0x0

    .line 69
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/s;->setSupportsChangeAnimations(Z)V

    .line 70
    .line 71
    .line 72
    return-object p1
.end method

.method protected t(Landroidx/preference/PreferenceScreen;)Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .locals 1

    .line 1
    const-string p0, "XPG#PrefFragmentCompat"

    .line 2
    .line 3
    const-string v0, "onCreateAdapter in."

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance p0, LU3/a;

    .line 9
    .line 10
    invoke-direct {p0, p1}, LU3/a;-><init>(Landroidx/preference/PreferenceGroup;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const-string v2, "SettingsHomepageActivity"

    .line 14
    .line 15
    invoke-virtual {p3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    move v2, v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v2, v1

    .line 24
    :goto_0
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v3}, Lcom/zte/mifavor/widget/u;->j(Landroid/content/Context;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v0, v1

    .line 38
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v4, "onCreateRecyclerView in.. localActivity="

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p3, ", isCTSActivity="

    .line 52
    .line 53
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p3, ", isCTSMode="

    .line 60
    .line 61
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    const-string v2, "XPG#PrefFragmentCompat"

    .line 72
    .line 73
    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-virtual {p3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    const-string v3, "android.hardware.type.automotive"

    .line 85
    .line 86
    invoke-virtual {p3, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    if-eqz p3, :cond_3

    .line 91
    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    sget p3, LR3/g;->L:I

    .line 95
    .line 96
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView;

    .line 101
    .line 102
    const-string v3, "onCreateRecyclerView. main content scrollable container."

    .line 103
    .line 104
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    sget p3, LR3/g;->g0:I

    .line 109
    .line 110
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView;

    .line 115
    .line 116
    const-string v3, "onCreateRecyclerView. recycler view"

    .line 117
    .line 118
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :goto_2
    if-eqz p3, :cond_3

    .line 122
    .line 123
    return-object p3

    .line 124
    :cond_3
    if-eqz v0, :cond_4

    .line 125
    .line 126
    sget p3, LR3/i;->i:I

    .line 127
    .line 128
    invoke-virtual {p1, p3, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 135
    .line 136
    const-string p1, "onCreateRecyclerView. preference recyclerview mfs container."

    .line 137
    .line 138
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_4
    sget p3, LR3/i;->h:I

    .line 143
    .line 144
    invoke-virtual {p1, p3, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 149
    .line 150
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 151
    .line 152
    const-string p1, "onCreateRecyclerView. preference recyclerview mfs."

    .line 153
    .line 154
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    :goto_3
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->u()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 167
    .line 168
    new-instance p2, Landroidx/preference/g;

    .line 169
    .line 170
    iget-object p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 171
    .line 172
    invoke-direct {p2, p3}, Landroidx/preference/g;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Landroidx/recyclerview/widget/q;)V

    .line 176
    .line 177
    .line 178
    const-string p1, "onCreateRecyclerView out."

    .line 179
    .line 180
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 184
    .line 185
    return-object p0
.end method
