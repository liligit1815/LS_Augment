.class public final Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;
.super Ljava/lang/Object;
.source "AppPairIconGraphic.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/apppairs/AppPairIconGraphic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;
    .locals 5

    .line 1
    const-string p0, "appPairInfo"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "p"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/l;->O()Lcom/android/launcher3/model/data/I;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, LW0/b;->e()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/l;->P()Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2}, LW0/b;->e()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p2}, LW0/b;->i()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    float-to-int v2, v2

    .line 41
    invoke-virtual {p2}, LW0/b;->i()F

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    float-to-int v3, v3

    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual {p0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, LW0/b;->i()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    float-to-int v2, v2

    .line 55
    invoke-virtual {p2}, LW0/b;->i()F

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    float-to-int v3, v3

    .line 60
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2}, LW0/b;->e()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, v2}, Lcom/android/launcher3/model/data/l;->R(Landroid/content/Context;)Lh4/l;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {p1}, Lh4/l;->b()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez v2, :cond_0

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Ls1/o;->s(Z)V

    .line 94
    .line 95
    .line 96
    :cond_0
    if-nez p1, :cond_1

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ls1/o;->s(Z)V

    .line 99
    .line 100
    .line 101
    :cond_1
    new-instance p1, Lcom/android/launcher3/apppairs/a;

    .line 102
    .line 103
    invoke-direct {p1, p2, p0, v0}, Lcom/android/launcher3/apppairs/a;-><init>(LW0/b;Ls1/o;Ls1/o;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, LW0/b;->g()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p2}, LW0/b;->g()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    invoke-virtual {p1, v4, v4, p0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 115
    .line 116
    .line 117
    return-object p1
.end method
