.class public Lcom/zte/mifavor/widget/SwitchZTE;
.super Landroid/widget/Switch;
.source "SwitchZTE.java"


# static fields
.field public static final m:[I

.field public static final n:[I

.field private static final o:[I

.field private static final p:[I

.field private static final q:[I

.field private static final r:[I

.field private static s:Ljava/lang/String;


# instance fields
.field g:I

.field h:I

.field i:I

.field j:I

.field private k:Landroid/content/Context;

.field private l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

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
    sput-object v2, Lcom/zte/mifavor/widget/SwitchZTE;->m:[I

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
    move-result-object v3

    .line 20
    sput-object v3, Lcom/zte/mifavor/widget/SwitchZTE;->n:[I

    .line 21
    .line 22
    filled-new-array {v0, v1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    sput-object v3, Lcom/zte/mifavor/widget/SwitchZTE;->o:[I

    .line 27
    .line 28
    filled-new-array {v0, v2}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Lcom/zte/mifavor/widget/SwitchZTE;->p:[I

    .line 33
    .line 34
    const v0, -0x101009e

    .line 35
    .line 36
    .line 37
    filled-new-array {v0, v1}, [I

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sput-object v1, Lcom/zte/mifavor/widget/SwitchZTE;->q:[I

    .line 42
    .line 43
    filled-new-array {v0, v2}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lcom/zte/mifavor/widget/SwitchZTE;->r:[I

    .line 48
    .line 49
    const-string v0, "SwitchZTE"

    .line 50
    .line 51
    sput-object v0, Lcom/zte/mifavor/widget/SwitchZTE;->s:Ljava/lang/String;

    .line 52
    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget v0, LR3/c;->r:I

    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/SwitchZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Switch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, -0x1

    .line 3
    iput p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->g:I

    .line 4
    iput p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->h:I

    .line 5
    iput p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->i:I

    .line 6
    iput p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->j:I

    const/4 p2, 0x0

    .line 7
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->l:Z

    .line 8
    const-string p3, ""

    invoke-virtual {p0, p3}, Landroid/widget/Switch;->setTextOn(Ljava/lang/CharSequence;)V

    .line 9
    invoke-virtual {p0, p3}, Landroid/widget/Switch;->setTextOff(Ljava/lang/CharSequence;)V

    .line 10
    iput-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 11
    sget p3, LR3/f;->K:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    iget-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    sget p3, LR3/f;->L:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    sget-boolean p1, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p1, :cond_0

    .line 14
    invoke-virtual {p0, p2}, Landroid/widget/Switch;->setForceDarkAllowed(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/Switch;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    const-class p1, Landroid/widget/Switch;

    .line 5
    .line 6
    const-string p2, "mSwitchWidth"

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {p2}, Lb4/g;->h(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    sget-object v0, Lcom/zte/mifavor/widget/SwitchZTE;->s:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "on Measure: isOutScreen="

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    if-eqz p2, :cond_0

    .line 45
    .line 46
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 47
    .line 48
    const/16 v0, 0x32

    .line 49
    .line 50
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/Switch;->getMeasuredWidthAndState()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-ne p1, p2, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 70
    .line 71
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 76
    .line 77
    const/16 v0, 0x1e

    .line 78
    .line 79
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/widget/Switch;->setMeasuredDimension(II)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 88
    .line 89
    const/16 v0, 0x28

    .line 90
    .line 91
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/Switch;->getMeasuredWidthAndState()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 103
    .line 104
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-ne p1, p2, :cond_1

    .line 109
    .line 110
    iget-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 111
    .line 112
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object p2, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 117
    .line 118
    const/16 v0, 0x18

    .line 119
    .line 120
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    invoke-virtual {p0, p1, p2}, Landroid/widget/Switch;->setMeasuredDimension(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :catch_0
    move-exception p0

    .line 129
    sget-object p1, Lcom/zte/mifavor/widget/SwitchZTE;->s:Ljava/lang/String;

    .line 130
    .line 131
    new-instance p2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v0, "Exception="

    .line 137
    .line 138
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    :cond_1
    return-void
.end method

.method public setNightStyle(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 4
    .line 5
    sget v0, LR3/f;->M:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/SwitchZTE;->k:Landroid/content/Context;

    .line 16
    .line 17
    sget v0, LR3/f;->L:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
