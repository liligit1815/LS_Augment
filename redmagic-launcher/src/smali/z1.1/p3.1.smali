.class public final Lz1/p3;
.super Ljava/lang/Object;
.source "ModelTaskController_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lz1/o3;",
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
            "Ls1/P;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/y0;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/m;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lz1/y0;",
            ">;",
            "Lg4/a<",
            "Lz1/m;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/p3;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/p3;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/p3;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/p3;->d:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/p3;->e:Lg4/a;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lz1/p3;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lz1/y0;",
            ">;",
            "Lg4/a<",
            "Lz1/m;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;)",
            "Lz1/p3;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/p3;

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
    invoke-direct/range {v0 .. v5}, Lz1/p3;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static c(Landroid/content/Context;Ls1/P;Lz1/y0;Lz1/m;Lcom/android/launcher3/D3;)Lz1/o3;
    .locals 6

    .line 1
    new-instance v0, Lz1/o3;

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
    invoke-direct/range {v0 .. v5}, Lz1/o3;-><init>(Landroid/content/Context;Ls1/P;Lz1/y0;Lz1/m;Lcom/android/launcher3/D3;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public b()Lz1/o3;
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/p3;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    iget-object v1, p0, Lz1/p3;->b:Lg4/a;

    .line 10
    .line 11
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ls1/P;

    .line 16
    .line 17
    iget-object v2, p0, Lz1/p3;->c:Lg4/a;

    .line 18
    .line 19
    invoke-interface {v2}, Lg4/a;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lz1/y0;

    .line 24
    .line 25
    iget-object v3, p0, Lz1/p3;->d:Lg4/a;

    .line 26
    .line 27
    invoke-interface {v3}, Lg4/a;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lz1/m;

    .line 32
    .line 33
    iget-object p0, p0, Lz1/p3;->e:Lg4/a;

    .line 34
    .line 35
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/android/launcher3/D3;

    .line 40
    .line 41
    invoke-static {v0, v1, v2, v3, p0}, Lz1/p3;->c(Landroid/content/Context;Ls1/P;Lz1/y0;Lz1/m;Lcom/android/launcher3/D3;)Lz1/o3;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lz1/p3;->b()Lz1/o3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
