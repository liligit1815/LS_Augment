.class public abstract Landroidx/dynamicanimation/animation/e;
.super Ljava/lang/Object;
.source "DynamicAnimation.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/b$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/dynamicanimation/animation/e$s;,
        Landroidx/dynamicanimation/animation/e$q;,
        Landroidx/dynamicanimation/animation/e$r;,
        Landroidx/dynamicanimation/animation/e$p;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/dynamicanimation/animation/e<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Landroidx/dynamicanimation/animation/b$c;"
    }
.end annotation


# static fields
.field public static final A:Landroidx/dynamicanimation/animation/e$s;

.field public static final n:Landroidx/dynamicanimation/animation/e$s;

.field public static final o:Landroidx/dynamicanimation/animation/e$s;

.field public static final p:Landroidx/dynamicanimation/animation/e$s;

.field public static final q:Landroidx/dynamicanimation/animation/e$s;

.field public static final r:Landroidx/dynamicanimation/animation/e$s;

.field public static final s:Landroidx/dynamicanimation/animation/e$s;

.field public static final t:Landroidx/dynamicanimation/animation/e$s;

.field public static final u:Landroidx/dynamicanimation/animation/e$s;

.field public static final v:Landroidx/dynamicanimation/animation/e$s;

.field public static final w:Landroidx/dynamicanimation/animation/e$s;

.field public static final x:Landroidx/dynamicanimation/animation/e$s;

.field public static final y:Landroidx/dynamicanimation/animation/e$s;

.field public static final z:Landroidx/dynamicanimation/animation/e$s;


# instance fields
.field a:F

.field b:F

.field c:Z

.field final d:Ljava/lang/Object;

.field final e:Landroidx/dynamicanimation/animation/g;

.field f:Z

.field g:F

.field h:F

.field private i:J

.field private j:F

.field private final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/e$q;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/e$r;",
            ">;"
        }
    .end annotation
.end field

.field private m:Landroidx/dynamicanimation/animation/b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/dynamicanimation/animation/e$g;

    .line 2
    .line 3
    const-string v1, "translationX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$g;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Landroidx/dynamicanimation/animation/e;->n:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    new-instance v0, Landroidx/dynamicanimation/animation/e$h;

    .line 11
    .line 12
    const-string v1, "translationY"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$h;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 18
    .line 19
    new-instance v0, Landroidx/dynamicanimation/animation/e$i;

    .line 20
    .line 21
    const-string v1, "translationZ"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$i;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Landroidx/dynamicanimation/animation/e;->p:Landroidx/dynamicanimation/animation/e$s;

    .line 27
    .line 28
    new-instance v0, Landroidx/dynamicanimation/animation/e$j;

    .line 29
    .line 30
    const-string v1, "scaleX"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$j;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 36
    .line 37
    new-instance v0, Landroidx/dynamicanimation/animation/e$k;

    .line 38
    .line 39
    const-string v1, "scaleY"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$k;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 45
    .line 46
    new-instance v0, Landroidx/dynamicanimation/animation/e$l;

    .line 47
    .line 48
    const-string v1, "rotation"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$l;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Landroidx/dynamicanimation/animation/e;->s:Landroidx/dynamicanimation/animation/e$s;

    .line 54
    .line 55
    new-instance v0, Landroidx/dynamicanimation/animation/e$m;

    .line 56
    .line 57
    const-string v1, "rotationX"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$m;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Landroidx/dynamicanimation/animation/e;->t:Landroidx/dynamicanimation/animation/e$s;

    .line 63
    .line 64
    new-instance v0, Landroidx/dynamicanimation/animation/e$n;

    .line 65
    .line 66
    const-string v1, "rotationY"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$n;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Landroidx/dynamicanimation/animation/e;->u:Landroidx/dynamicanimation/animation/e$s;

    .line 72
    .line 73
    new-instance v0, Landroidx/dynamicanimation/animation/e$o;

    .line 74
    .line 75
    const-string v1, "x"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$o;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Landroidx/dynamicanimation/animation/e;->v:Landroidx/dynamicanimation/animation/e$s;

    .line 81
    .line 82
    new-instance v0, Landroidx/dynamicanimation/animation/e$a;

    .line 83
    .line 84
    const-string v1, "y"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$a;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Landroidx/dynamicanimation/animation/e;->w:Landroidx/dynamicanimation/animation/e$s;

    .line 90
    .line 91
    new-instance v0, Landroidx/dynamicanimation/animation/e$b;

    .line 92
    .line 93
    const-string v1, "z"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$b;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Landroidx/dynamicanimation/animation/e;->x:Landroidx/dynamicanimation/animation/e$s;

    .line 99
    .line 100
    new-instance v0, Landroidx/dynamicanimation/animation/e$c;

    .line 101
    .line 102
    const-string v1, "alpha"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$c;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    .line 108
    .line 109
    new-instance v0, Landroidx/dynamicanimation/animation/e$d;

    .line 110
    .line 111
    const-string v1, "scrollX"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$d;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Landroidx/dynamicanimation/animation/e;->z:Landroidx/dynamicanimation/animation/e$s;

    .line 117
    .line 118
    new-instance v0, Landroidx/dynamicanimation/animation/e$e;

    .line 119
    .line 120
    const-string v1, "scrollY"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/e$e;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Landroidx/dynamicanimation/animation/e;->A:Landroidx/dynamicanimation/animation/e$s;

    .line 126
    .line 127
    return-void
.end method

.method constructor <init>(Landroidx/dynamicanimation/animation/h;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->a:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/e;->c:Z

    .line 5
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 6
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->g:F

    neg-float v0, v0

    .line 7
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    const-wide/16 v0, 0x0

    .line 8
    iput-wide v0, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->d:Ljava/lang/Object;

    .line 12
    new-instance v0, Landroidx/dynamicanimation/animation/e$f;

    const-string v1, "FloatValueHolder"

    invoke-direct {v0, p0, v1, p1}, Landroidx/dynamicanimation/animation/e$f;-><init>(Landroidx/dynamicanimation/animation/e;Ljava/lang/String;Landroidx/dynamicanimation/animation/h;)V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->e:Landroidx/dynamicanimation/animation/g;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->a:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 16
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/e;->c:Z

    .line 18
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 19
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->g:F

    neg-float v0, v0

    .line 20
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    const-wide/16 v0, 0x0

    .line 21
    iput-wide v0, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 24
    iput-object p1, p0, Landroidx/dynamicanimation/animation/e;->d:Ljava/lang/Object;

    .line 25
    iput-object p2, p0, Landroidx/dynamicanimation/animation/e;->e:Landroidx/dynamicanimation/animation/g;

    .line 26
    sget-object p1, Landroidx/dynamicanimation/animation/e;->s:Landroidx/dynamicanimation/animation/e$s;

    if-eq p2, p1, :cond_4

    sget-object p1, Landroidx/dynamicanimation/animation/e;->t:Landroidx/dynamicanimation/animation/e$s;

    if-eq p2, p1, :cond_4

    sget-object p1, Landroidx/dynamicanimation/animation/e;->u:Landroidx/dynamicanimation/animation/e$s;

    if-ne p2, p1, :cond_0

    goto :goto_1

    .line 27
    :cond_0
    sget-object p1, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    if-ne p2, p1, :cond_1

    const/high16 p1, 0x3b800000    # 0.00390625f

    .line 28
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    return-void

    .line 29
    :cond_1
    sget-object p1, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    if-eq p2, p1, :cond_3

    sget-object p1, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    if-ne p2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    return-void

    :cond_3
    :goto_0
    const p1, 0x3b03126f    # 0.002f

    .line 31
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    return-void

    :cond_4
    :goto_1
    const p1, 0x3dcccccd    # 0.1f

    .line 32
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    return-void
.end method

.method private d(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, p0}, Landroidx/dynamicanimation/animation/b;->k(Landroidx/dynamicanimation/animation/b$c;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 14
    .line 15
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->c:Z

    .line 16
    .line 17
    :goto_0
    iget-object v1, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroidx/dynamicanimation/animation/e$q;

    .line 40
    .line 41
    iget v2, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 42
    .line 43
    iget v3, p0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 44
    .line 45
    invoke-interface {v1, p0, p1, v2, v3}, Landroidx/dynamicanimation/animation/e$q;->onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-static {p0}, Landroidx/dynamicanimation/animation/e;->k(Ljava/util/ArrayList;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private f()F
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->e:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->d:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroidx/dynamicanimation/animation/g;->getValue(Ljava/lang/Object;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private static j(Ljava/util/ArrayList;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static k(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 7
    .line 8
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->c:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Landroidx/dynamicanimation/animation/e;->f()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 19
    .line 20
    iget v1, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 21
    .line 22
    cmpl-float v1, v0, v1

    .line 23
    .line 24
    if-gtz v1, :cond_1

    .line 25
    .line 26
    iget v1, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 27
    .line 28
    cmpg-float v0, v0, v1

    .line 29
    .line 30
    if-ltz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1, v2}, Landroidx/dynamicanimation/animation/b;->d(Landroidx/dynamicanimation/animation/b$c;J)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 43
    .line 44
    const-string v0, "Starting value need to be in between min value and max value"

    .line 45
    .line 46
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_2
    return-void
.end method


# virtual methods
.method public a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/e$q;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/e$r;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0

    .line 21
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 22
    .line 23
    const-string p1, "Error: Update listeners must be added beforethe animation."

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0
.end method

.method public c()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/b;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-direct {p0, v0}, Landroidx/dynamicanimation/animation/e;->d(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 21
    .line 22
    const-string v0, "Animations may only be canceled from the same thread as the animation handler"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method public doAnimationFrame(J)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 11
    .line 12
    iget p1, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->p(F)V

    .line 15
    .line 16
    .line 17
    return v3

    .line 18
    :cond_0
    sub-long v0, p1, v0

    .line 19
    .line 20
    iput-wide p1, p0, Landroidx/dynamicanimation/animation/e;->i:J

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/b;->g()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x0

    .line 31
    cmpl-float p2, p1, p2

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    const-wide/32 p1, 0x7fffffff

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    long-to-float p2, v0

    .line 40
    div-float/2addr p2, p1

    .line 41
    float-to-long p1, p2

    .line 42
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroidx/dynamicanimation/animation/e;->v(J)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget p2, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 47
    .line 48
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 49
    .line 50
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 55
    .line 56
    iget v0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 57
    .line 58
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput p2, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 63
    .line 64
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/e;->p(F)V

    .line 65
    .line 66
    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-direct {p0, v3}, Landroidx/dynamicanimation/animation/e;->d(Z)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return p1
.end method

.method public e()Landroidx/dynamicanimation/animation/b;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->m:Landroidx/dynamicanimation/animation/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Landroidx/dynamicanimation/animation/b;->h()Landroidx/dynamicanimation/animation/b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method g()F
    .locals 1

    .line 1
    iget p0, p0, Landroidx/dynamicanimation/animation/e;->j:F

    .line 2
    .line 3
    const/high16 v0, 0x3f400000    # 0.75f

    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(Landroidx/dynamicanimation/animation/e$q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroidx/dynamicanimation/animation/e;->j(Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Landroidx/dynamicanimation/animation/e$r;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroidx/dynamicanimation/animation/e;->j(Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(F)Landroidx/dynamicanimation/animation/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 2
    .line 3
    return-object p0
.end method

.method public n(F)Landroidx/dynamicanimation/animation/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 2
    .line 3
    return-object p0
.end method

.method public o(F)Landroidx/dynamicanimation/animation/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->j:F

    .line 7
    .line 8
    const/high16 v0, 0x3f400000    # 0.75f

    .line 9
    .line 10
    mul-float/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->s(F)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 16
    .line 17
    const-string p1, "Minimum visible change must be positive."

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method

.method p(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->e:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/dynamicanimation/animation/e;->d:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Landroidx/dynamicanimation/animation/g;->setValue(Ljava/lang/Object;F)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    :goto_0
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroidx/dynamicanimation/animation/e$r;

    .line 32
    .line 33
    iget v1, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 34
    .line 35
    iget v2, p0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 36
    .line 37
    invoke-interface {v0, p0, v1, v2}, Landroidx/dynamicanimation/animation/e$r;->a(Landroidx/dynamicanimation/animation/e;FF)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e;->l:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-static {p0}, Landroidx/dynamicanimation/animation/e;->k(Ljava/util/ArrayList;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public q(F)Landroidx/dynamicanimation/animation/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/e;->c:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public r(F)Landroidx/dynamicanimation/animation/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 2
    .line 3
    return-object p0
.end method

.method abstract s(F)V
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/b;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Landroidx/dynamicanimation/animation/e;->u()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 20
    .line 21
    const-string v0, "Animations may only be started on the same thread as the animation handler"

    .line 22
    .line 23
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method

.method abstract v(J)Z
.end method
