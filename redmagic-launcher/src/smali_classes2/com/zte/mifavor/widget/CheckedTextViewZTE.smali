.class public Lcom/zte/mifavor/widget/CheckedTextViewZTE;
.super Landroid/widget/CheckedTextView;
.source "CheckedTextViewZTE.java"


# static fields
.field private static final h:[I

.field private static final i:[I

.field private static final j:[I

.field private static final k:[I


# instance fields
.field private g:Lcom/zte/mifavor/widget/g;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const v0, 0x101009e

    .line 2
    .line 3
    .line 4
    const v1, -0x10100a0

    .line 5
    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sput-object v2, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->h:[I

    .line 12
    .line 13
    const v2, 0x10100a0

    .line 14
    .line 15
    .line 16
    filled-new-array {v0, v2}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->i:[I

    .line 21
    .line 22
    const v0, -0x101009e

    .line 23
    .line 24
    .line 25
    filled-new-array {v0, v1}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sput-object v1, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->j:[I

    .line 30
    .line 31
    filled-new-array {v0, v2}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->k:[I

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x10103c8

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/CheckedTextViewZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/CheckedTextViewZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance v0, Lcom/zte/mifavor/widget/g;

    invoke-direct {v0}, Lcom/zte/mifavor/widget/g;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, LR3/d;->o:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, LR3/d;->n:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 7
    invoke-direct {p0, v0, v1}, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->a(II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/CheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->g:Lcom/zte/mifavor/widget/g;

    invoke-virtual {v0, p0, p2, p3, p4}, Lcom/zte/mifavor/widget/g;->b(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    .line 9
    sget-boolean p2, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    .line 10
    invoke-virtual {p0, p2}, Landroid/widget/CheckedTextView;->setForceDarkAllowed(Z)V

    .line 11
    :cond_0
    invoke-static {p1}, Lcom/zte/mifavor/widget/u;->l(Landroid/content/Context;)Z

    return-void
.end method

.method private a(II)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, LR3/f;->d:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public getAnimationDrawable()Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/drawable/AnimatedStateListDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/AnimatedStateListDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, LR3/d;->o:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, LR3/d;->n:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    sget v3, LR3/f;->x:I

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget-object v4, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->k:[I

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-virtual {v0, v4, v2, v5}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    sget v6, LR3/f;->w:I

    .line 58
    .line 59
    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/16 v7, 0x42

    .line 68
    .line 69
    invoke-virtual {v2, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 73
    .line 74
    .line 75
    sget-object v2, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->j:[I

    .line 76
    .line 77
    invoke-virtual {v0, v2, v4, v5}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget-object v3, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->i:[I

    .line 93
    .line 94
    sget v4, LR3/g;->T:I

    .line 95
    .line 96
    invoke-virtual {v0, v3, v2, v4}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    const/16 v3, 0xff

    .line 112
    .line 113
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 117
    .line 118
    .line 119
    sget-object v1, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->h:[I

    .line 120
    .line 121
    sget v3, LR3/g;->S:I

    .line 122
    .line 123
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget v2, LR3/f;->y:I

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 137
    .line 138
    invoke-virtual {v0, v3, v4, v1, v5}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addTransition(IILandroid/graphics/drawable/Drawable;Z)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/widget/CheckedTextView;->getContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget v1, LR3/f;->z:I

    .line 146
    .line 147
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    check-cast p0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 152
    .line 153
    invoke-virtual {v0, v4, v3, p0, v5}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addTransition(IILandroid/graphics/drawable/Drawable;Z)V

    .line 154
    .line 155
    .line 156
    return-object v0
.end method

.method public setTextAppearance(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckedTextView;->setTextAppearance(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->d(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTextFontScale(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/CheckedTextViewZTE;->g:Lcom/zte/mifavor/widget/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
