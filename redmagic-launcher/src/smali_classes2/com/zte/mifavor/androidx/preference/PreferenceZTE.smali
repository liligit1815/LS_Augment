.class public Lcom/zte/mifavor/androidx/preference/PreferenceZTE;
.super Landroidx/preference/Preference;
.source "PreferenceZTE.java"


# instance fields
.field private final W:Z

.field private X:Ljava/lang/CharSequence;

.field private Y:Landroid/content/Context;

.field private Z:Landroid/widget/TextView;

.field private a0:Landroid/widget/TextView;

.field private b0:Landroid/widget/TextView;

.field private c0:Landroid/view/View;

.field private d0:Z

.field private e0:I

.field private f0:Z

.field private g0:Ljava/lang/String;

.field private h0:Z

.field private i0:Landroid/graphics/drawable/Drawable;

.field private j0:Z

.field private k0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 27
    invoke-direct {p0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->W:Z

    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->b0:Landroid/widget/TextView;

    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->d0:Z

    const/4 v2, -0x1

    .line 31
    iput v2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->e0:I

    .line 32
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->f0:Z

    .line 33
    const-string v2, ""

    iput-object v2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->g0:Ljava/lang/String;

    .line 34
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->h0:Z

    .line 35
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->i0:Landroid/graphics/drawable/Drawable;

    .line 36
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->j0:Z

    const/4 v0, -0x2

    .line 37
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->k0:I

    .line 38
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Y:Landroid/content/Context;

    .line 39
    iput-object v2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->X:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 25
    sget v0, LR3/c;->n:I

    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Z0(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 14
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->W:Z

    const/4 p3, 0x0

    .line 15
    iput-object p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->b0:Landroid/widget/TextView;

    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->d0:Z

    const/4 v1, -0x1

    .line 17
    iput v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->e0:I

    .line 18
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->f0:Z

    .line 19
    const-string v1, ""

    iput-object v1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->g0:Ljava/lang/String;

    .line 20
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->h0:Z

    .line 21
    iput-object p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->i0:Landroid/graphics/drawable/Drawable;

    .line 22
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->j0:Z

    const/4 p3, -0x2

    .line 23
    iput p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->k0:I

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Z0(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->W:Z

    const/4 p3, 0x0

    .line 3
    iput-object p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->b0:Landroid/widget/TextView;

    const/4 p4, 0x1

    .line 4
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->d0:Z

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->e0:I

    .line 6
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->f0:Z

    .line 7
    const-string v0, ""

    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->g0:Ljava/lang/String;

    .line 8
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->h0:Z

    .line 9
    iput-object p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->i0:Landroid/graphics/drawable/Drawable;

    .line 10
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->j0:Z

    const/4 p3, -0x2

    .line 11
    iput p3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->k0:I

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Z0(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private Z0(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Y:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v0, LR3/m;->K2:[I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, LR3/m;->U2:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->X:Ljava/lang/CharSequence;

    .line 16
    .line 17
    sget p2, LR3/m;->R2:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->g0:Ljava/lang/String;

    .line 24
    .line 25
    sget p2, LR3/m;->O2:I

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->h0:Z

    .line 33
    .line 34
    sget p2, LR3/m;->Q2:I

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->i0:Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    sget p2, LR3/m;->S2:I

    .line 43
    .line 44
    const/4 v1, -0x2

    .line 45
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->k0:I

    .line 50
    .line 51
    sget p2, LR3/m;->T2:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->j0:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    .line 61
    .line 62
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
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Z:Landroid/widget/TextView;

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
    invoke-super {p0, p1}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public U0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->h0:Z

    .line 2
    .line 3
    return p0
.end method

.method public V0()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->i0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public W(Landroidx/preference/h;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020016

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
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->b0:Landroid/widget/TextView;

    .line 14
    .line 15
    const v0, 0x1020010

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Z:Landroid/widget/TextView;

    .line 25
    .line 26
    const v0, 0x1020018

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/widget/LinearLayout;

    .line 34
    .line 35
    if-eqz p1, :cond_4

    .line 36
    .line 37
    sget v0, LR3/g;->p0:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/TextView;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 46
    .line 47
    const/16 v1, 0x8

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->Y0()Ljava/lang/CharSequence;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_0

    .line 61
    .line 62
    iget-object v3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 73
    .line 74
    iget-boolean v3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->f0:Z

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 77
    .line 78
    .line 79
    const/4 v0, -0x1

    .line 80
    iget v3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->e0:I

    .line 81
    .line 82
    if-eq v0, v3, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget v3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->e0:I

    .line 91
    .line 92
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 93
    .line 94
    iget-object v3, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 95
    .line 96
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    sget v0, LR3/g;->G:I

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->c0:Landroid/view/View;

    .line 112
    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->d0:Z

    .line 116
    .line 117
    if-eqz p0, :cond_2

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    const-string v0, "onBindViewHolder indicator = "

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 138
    .line 139
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    const-string p1, "PreferenceZTEx"

    .line 147
    .line 148
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    :cond_4
    return-void
.end method

.method public W0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->g0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public X0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->j0:Z

    .line 2
    .line 3
    return p0
.end method

.method public Y0()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->X:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public a1(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->X:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->Q()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->k0:I

    .line 2
    .line 3
    return p0
.end method

.method public v0(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->v0(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a0:Landroid/widget/TextView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->b0:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const v1, 0x3e851eb8    # 0.26f

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    :cond_2
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->f0:Z

    .line 27
    .line 28
    return-void
.end method
