.class public final LM2/j;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"


# static fields
.field private static final a:F = -3.4028235E38f

.field private static final b:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "LM2/i<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final c:LM2/i$f;

.field private static final d:LM2/i$d;

.field private static e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM2/j;->b:Ljava/util/WeakHashMap;

    .line 7
    .line 8
    new-instance v0, LM2/i$f;

    .line 9
    .line 10
    const v1, 0x44bb8000    # 1500.0f

    .line 11
    .line 12
    .line 13
    const/high16 v2, 0x3f000000    # 0.5f

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, LM2/i$f;-><init>(FF)V

    .line 16
    .line 17
    .line 18
    sput-object v0, LM2/j;->c:LM2/i$f;

    .line 19
    .line 20
    new-instance v0, LM2/i$d;

    .line 21
    .line 22
    const v1, -0x800001

    .line 23
    .line 24
    .line 25
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 26
    .line 27
    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    invoke-direct {v0, v3, v1, v2}, LM2/i$d;-><init>(FFF)V

    .line 31
    .line 32
    .line 33
    sput-object v0, LM2/j;->d:LM2/i$d;

    .line 34
    .line 35
    return-void
.end method

.method public static final synthetic a()LM2/i$d;
    .locals 1

    .line 1
    sget-object v0, LM2/j;->d:LM2/i$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b()LM2/i$f;
    .locals 1

    .line 1
    sget-object v0, LM2/j;->c:LM2/i$f;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic c()F
    .locals 1

    .line 1
    sget v0, LM2/j;->a:F

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic d()Z
    .locals 1

    .line 1
    sget-boolean v0, LM2/j;->e:Z

    .line 2
    .line 3
    return v0
.end method

.method public static final e()Ljava/util/WeakHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "LM2/i<",
            "*>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, LM2/j;->b:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    return-object v0
.end method
