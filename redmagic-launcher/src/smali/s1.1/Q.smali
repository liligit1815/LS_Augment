.class public final Ls1/Q;
.super Ljava/lang/Object;
.source "IconCache_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Ls1/P;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "LD1/t;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ls1/V;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "LD1/b;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ls1/X$b;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Ljava/lang/String;",
            ">;",
            "Lg4/a<",
            "LD1/t;",
            ">;",
            "Lg4/a<",
            "Ls1/V;",
            ">;",
            "Lg4/a<",
            "LD1/b;",
            ">;",
            "Lg4/a<",
            "Ls1/X$b;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/Q;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Ls1/Q;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Ls1/Q;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Ls1/Q;->d:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Ls1/Q;->e:Lg4/a;

    .line 13
    .line 14
    iput-object p6, p0, Ls1/Q;->f:Lg4/a;

    .line 15
    .line 16
    iput-object p7, p0, Ls1/Q;->g:Lg4/a;

    .line 17
    .line 18
    iput-object p8, p0, Ls1/Q;->h:Lg4/a;

    .line 19
    .line 20
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Ls1/Q;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Ljava/lang/String;",
            ">;",
            "Lg4/a<",
            "LD1/t;",
            ">;",
            "Lg4/a<",
            "Ls1/V;",
            ">;",
            "Lg4/a<",
            "LD1/b;",
            ">;",
            "Lg4/a<",
            "Ls1/X$b;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Ls1/Q;"
        }
    .end annotation

    .line 1
    new-instance v0, Ls1/Q;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Ls1/Q;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;LD1/t;Ls1/V;LD1/b;Ls1/X$b;Lcom/android/launcher3/util/K;)Ls1/P;
    .locals 9

    .line 1
    new-instance v0, Ls1/P;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Ls1/P;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;LD1/t;Ls1/V;LD1/b;Ls1/X$b;Lcom/android/launcher3/util/K;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public b()Ls1/P;
    .locals 9

    .line 1
    iget-object v0, p0, Ls1/Q;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v0, p0, Ls1/Q;->b:Lg4/a;

    .line 11
    .line 12
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v2, v0

    .line 17
    check-cast v2, Lcom/android/launcher3/F1;

    .line 18
    .line 19
    iget-object v0, p0, Ls1/Q;->c:Lg4/a;

    .line 20
    .line 21
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v3, v0

    .line 26
    check-cast v3, Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p0, Ls1/Q;->d:Lg4/a;

    .line 29
    .line 30
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v4, v0

    .line 35
    check-cast v4, LD1/t;

    .line 36
    .line 37
    iget-object v0, p0, Ls1/Q;->e:Lg4/a;

    .line 38
    .line 39
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v5, v0

    .line 44
    check-cast v5, Ls1/V;

    .line 45
    .line 46
    iget-object v0, p0, Ls1/Q;->f:Lg4/a;

    .line 47
    .line 48
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    move-object v6, v0

    .line 53
    check-cast v6, LD1/b;

    .line 54
    .line 55
    iget-object v0, p0, Ls1/Q;->g:Lg4/a;

    .line 56
    .line 57
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    move-object v7, v0

    .line 62
    check-cast v7, Ls1/X$b;

    .line 63
    .line 64
    iget-object p0, p0, Ls1/Q;->h:Lg4/a;

    .line 65
    .line 66
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    move-object v8, p0

    .line 71
    check-cast v8, Lcom/android/launcher3/util/K;

    .line 72
    .line 73
    invoke-static/range {v1 .. v8}, Ls1/Q;->c(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/String;LD1/t;Ls1/V;LD1/b;Ls1/X$b;Lcom/android/launcher3/util/K;)Ls1/P;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/Q;->b()Ls1/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
