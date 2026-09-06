.class public final LU/f;
.super Ljava/lang/Object;
.source "FloatMapping.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/f$a;
    }
.end annotation


# static fields
.field public static final c:LU/f$a;

.field public static final d:LU/f;


# instance fields
.field private final a:Lo/m;

.field private final b:Lo/m;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LU/f$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/f$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/f;->c:LU/f$a;

    .line 8
    .line 9
    new-instance v0, LU/f;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/high16 v2, 0x3f000000    # 0.5f

    .line 21
    .line 22
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2, v2}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v1, v2}, [Lh4/l;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {v0, v1}, LU/f;-><init>([Lh4/l;)V

    .line 35
    .line 36
    .line 37
    sput-object v0, LU/f;->d:LU/f;

    .line 38
    .line 39
    return-void
.end method

.method public varargs constructor <init>([Lh4/l;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lh4/l<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "mappings"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lo/m;

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    invoke-direct {v0, v1}, Lo/m;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, LU/f;->a:Lo/m;

    .line 16
    .line 17
    new-instance v0, Lo/m;

    .line 18
    .line 19
    array-length v1, p1

    .line 20
    invoke-direct {v0, v1}, Lo/m;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LU/f;->b:Lo/m;

    .line 24
    .line 25
    array-length v0, p1

    .line 26
    const/4 v1, 0x0

    .line 27
    :goto_0
    if-ge v1, v0, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, LU/f;->a:Lo/m;

    .line 30
    .line 31
    aget-object v3, p1, v1

    .line 32
    .line 33
    invoke-virtual {v3}, Lh4/l;->c()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/Number;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v2, v3}, Lo/m;->h(F)Z

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, LU/f;->b:Lo/m;

    .line 47
    .line 48
    aget-object v3, p1, v1

    .line 49
    .line 50
    invoke-virtual {v3}, Lh4/l;->d()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Ljava/lang/Number;

    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v2, v3}, Lo/m;->h(F)Z

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object p1, p0, LU/f;->a:Lo/m;

    .line 67
    .line 68
    invoke-static {p1}, LU/j;->d(Lo/f;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, LU/f;->b:Lo/m;

    .line 72
    .line 73
    invoke-static {p0}, LU/j;->d(Lo/f;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method


# virtual methods
.method public final a(F)F
    .locals 1

    .line 1
    iget-object v0, p0, LU/f;->a:Lo/m;

    .line 2
    .line 3
    iget-object p0, p0, LU/f;->b:Lo/m;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LU/j;->a(Lo/f;Lo/f;F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final b(F)F
    .locals 1

    .line 1
    iget-object v0, p0, LU/f;->b:Lo/m;

    .line 2
    .line 3
    iget-object p0, p0, LU/f;->a:Lo/m;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LU/j;->a(Lo/f;Lo/f;F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
