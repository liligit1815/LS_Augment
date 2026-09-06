.class public final LM2/i$k;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"

# interfaces
.implements LM2/i$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LM2/i;->H()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LM2/i$c<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:LM2/i$f;

.field final synthetic e:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;LM2/i;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;FF",
            "LM2/i$f;",
            "LM2/i<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LM2/i$k;->a:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    iput p2, p0, LM2/i$k;->b:F

    .line 4
    .line 5
    iput p3, p0, LM2/i$k;->c:F

    .line 6
    .line 7
    iput-object p4, p0, LM2/i$k;->d:LM2/i$f;

    .line 8
    .line 9
    iput-object p5, p0, LM2/i$k;->e:LM2/i;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;ZZFFZ)V"
        }
    .end annotation

    .line 1
    const-string p7, "property"

    .line 2
    .line 3
    invoke-static {p2, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p7, p0, LM2/i$k;->a:Landroidx/dynamicanimation/animation/g;

    .line 7
    .line 8
    invoke-static {p2, p7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_8

    .line 13
    .line 14
    if-eqz p3, :cond_8

    .line 15
    .line 16
    if-eqz p4, :cond_0

    .line 17
    .line 18
    goto/16 :goto_5

    .line 19
    .line 20
    :cond_0
    invoke-static {p6}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 p3, 0x0

    .line 25
    cmpl-float p2, p2, p3

    .line 26
    .line 27
    const/4 p4, 0x1

    .line 28
    const/4 p7, 0x0

    .line 29
    if-lez p2, :cond_1

    .line 30
    .line 31
    move p2, p4

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move p2, p7

    .line 34
    :goto_0
    iget v0, p0, LM2/i$k;->b:F

    .line 35
    .line 36
    cmpg-float v0, v0, p5

    .line 37
    .line 38
    if-gtz v0, :cond_2

    .line 39
    .line 40
    iget v0, p0, LM2/i$k;->c:F

    .line 41
    .line 42
    cmpg-float v0, p5, v0

    .line 43
    .line 44
    if-gtz v0, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move p4, p7

    .line 48
    :goto_1
    if-nez p2, :cond_3

    .line 49
    .line 50
    if-nez p4, :cond_8

    .line 51
    .line 52
    :cond_3
    iget-object p7, p0, LM2/i$k;->d:LM2/i$f;

    .line 53
    .line 54
    invoke-virtual {p7, p6}, LM2/i$f;->f(F)V

    .line 55
    .line 56
    .line 57
    iget-object p7, p0, LM2/i$k;->d:LM2/i$f;

    .line 58
    .line 59
    invoke-virtual {p7}, LM2/i$f;->c()F

    .line 60
    .line 61
    .line 62
    move-result p7

    .line 63
    invoke-static {}, LM2/j;->c()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    cmpg-float p7, p7, v0

    .line 68
    .line 69
    if-nez p7, :cond_7

    .line 70
    .line 71
    if-eqz p2, :cond_5

    .line 72
    .line 73
    iget-object p2, p0, LM2/i$k;->d:LM2/i$f;

    .line 74
    .line 75
    cmpg-float p3, p6, p3

    .line 76
    .line 77
    if-gez p3, :cond_4

    .line 78
    .line 79
    iget p3, p0, LM2/i$k;->b:F

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    iget p3, p0, LM2/i$k;->c:F

    .line 83
    .line 84
    :goto_2
    invoke-virtual {p2, p3}, LM2/i$f;->e(F)V

    .line 85
    .line 86
    .line 87
    goto :goto_4

    .line 88
    :cond_5
    if-nez p4, :cond_7

    .line 89
    .line 90
    iget-object p2, p0, LM2/i$k;->d:LM2/i$f;

    .line 91
    .line 92
    iget p3, p0, LM2/i$k;->b:F

    .line 93
    .line 94
    cmpg-float p4, p5, p3

    .line 95
    .line 96
    if-gez p4, :cond_6

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_6
    iget p3, p0, LM2/i$k;->c:F

    .line 100
    .line 101
    :goto_3
    invoke-virtual {p2, p3}, LM2/i$f;->e(F)V

    .line 102
    .line 103
    .line 104
    :cond_7
    :goto_4
    iget-object p2, p0, LM2/i$k;->e:LM2/i;

    .line 105
    .line 106
    iget-object p3, p0, LM2/i$k;->a:Landroidx/dynamicanimation/animation/g;

    .line 107
    .line 108
    invoke-static {p2, p3, p1}, LM2/i;->g(LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/j;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object p0, p0, LM2/i$k;->d:LM2/i$f;

    .line 113
    .line 114
    invoke-virtual {p0, p1}, LM2/i$f;->a(Landroidx/dynamicanimation/animation/j;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 118
    .line 119
    .line 120
    :cond_8
    :goto_5
    return-void
.end method
