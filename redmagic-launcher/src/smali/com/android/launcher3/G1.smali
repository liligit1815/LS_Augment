.class public final Lcom/android/launcher3/G1;
.super Ljava/lang/Object;
.source "InvariantDeviceProfile_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/launcher3/F1;",
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
            "Lcom/android/launcher3/J3;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/window/d;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ln1/C;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/J3;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/window/d;",
            ">;",
            "Lg4/a<",
            "Ln1/C;",
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
    iput-object p1, p0, Lcom/android/launcher3/G1;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/G1;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/G1;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/G1;->d:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/G1;->e:Lg4/a;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/G1;->f:Lg4/a;

    .line 15
    .line 16
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lcom/android/launcher3/G1;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/J3;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/window/d;",
            ">;",
            "Lg4/a<",
            "Ln1/C;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/launcher3/G1;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/G1;

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
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/G1;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/K;)Lcom/android/launcher3/F1;
    .locals 7

    .line 1
    new-instance v0, Lcom/android/launcher3/F1;

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
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/F1;-><init>(Landroid/content/Context;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/K;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/launcher3/F1;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/G1;->a:Lg4/a;

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
    iget-object v0, p0, Lcom/android/launcher3/G1;->b:Lg4/a;

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
    check-cast v2, Lcom/android/launcher3/J3;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/G1;->c:Lg4/a;

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
    check-cast v3, Lcom/android/launcher3/util/Z;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/G1;->d:Lg4/a;

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
    check-cast v4, Lcom/android/launcher3/util/window/d;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/G1;->e:Lg4/a;

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
    check-cast v5, Ln1/C;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/G1;->f:Lg4/a;

    .line 47
    .line 48
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    move-object v6, p0

    .line 53
    check-cast v6, Lcom/android/launcher3/util/K;

    .line 54
    .line 55
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/G1;->c(Landroid/content/Context;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/K;)Lcom/android/launcher3/F1;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/G1;->b()Lcom/android/launcher3/F1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
