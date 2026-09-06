.class public Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;
.super Landroidx/preference/ListPreference;
.source "ListPreferenceZTE.java"


# instance fields
.field private h0:Ljava/lang/CharSequence;

.field private i0:Landroid/content/Context;

.field private j0:Landroid/widget/TextView;

.field private k0:Landroid/widget/TextView;

.field private l0:I

.field private m0:Z

.field private n0:Ljava/lang/String;

.field private o0:Z

.field private p0:Landroid/graphics/drawable/Drawable;

.field private q0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget v0, LR3/c;->f:I

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->l0:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->m0:Z

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    iput-object v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->n0:Ljava/lang/String;

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->o0:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->p0:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    const/4 v0, -0x2

    .line 22
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->q0:I

    .line 23
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->j1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private j1(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->i0:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/preference/ListPreference;->e1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->h0:Ljava/lang/CharSequence;

    .line 8
    .line 9
    sget-object v0, LR3/m;->K2:[I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, LR3/m;->R2:I

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->n0:Ljava/lang/String;

    .line 22
    .line 23
    sget p2, LR3/m;->O2:I

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->o0:Z

    .line 31
    .line 32
    sget p2, LR3/m;->Q2:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->p0:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    sget p2, LR3/m;->S2:I

    .line 41
    .line 42
    const/4 v0, -0x2

    .line 43
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iput p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->q0:I

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string p2, "init Prefrence Status XPG#, key="

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p2, ", mStatus="

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->h0:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p2, ", mMyTag="

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->n0:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p2, ", mIsCard="

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->o0:Z

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p2, ", mNumber="

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->q0:I

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string p1, "ListPreferenceZTEx"

    .line 114
    .line 115
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public J0(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->j0:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroidx/preference/ListPreference;->J0(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public W(Landroidx/preference/h;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020010

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->j0:Landroid/widget/TextView;

    .line 14
    .line 15
    sget v0, LR3/g;->p0:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/widget/TextView;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 24
    .line 25
    const-string v0, "ListPreferenceZTEx"

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->i1()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 51
    .line 52
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->m0:Z

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 55
    .line 56
    .line 57
    const/4 p1, -0x1

    .line 58
    iget v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->l0:I

    .line 59
    .line 60
    if-eq p1, v1, :cond_0

    .line 61
    .line 62
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->l0:I

    .line 69
    .line 70
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 71
    .line 72
    iget-object v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    new-instance p1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v1, "onBindViewHolder the width of statusView = "

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    :cond_0
    return-void

    .line 106
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 107
    .line 108
    const/16 p1, 0x8

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v1, "onBindViewHolder statusView = "

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->k0:Landroid/widget/TextView;

    .line 125
    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->q0:I

    .line 2
    .line 3
    return p0
.end method

.method public h1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->o0:Z

    .line 2
    .line 3
    return p0
.end method

.method public i1()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->h0:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method
