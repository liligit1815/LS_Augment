.class public final LD1/u;
.super Ljava/lang/Object;
.source "UserCache_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "LD1/t;",
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
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/u;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, LD1/u;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, LD1/u;->c:Lg4/a;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;)LD1/u;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/f;",
            ">;)",
            "LD1/u;"
        }
    .end annotation

    .line 1
    new-instance v0, LD1/u;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, LD1/u;-><init>(Lg4/a;Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/f;)LD1/t;
    .locals 1

    .line 1
    new-instance v0, LD1/t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, LD1/t;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()LD1/t;
    .locals 2

    .line 1
    iget-object v0, p0, LD1/u;->a:Lg4/a;

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
    iget-object v1, p0, LD1/u;->b:Lg4/a;

    .line 10
    .line 11
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/android/launcher3/util/K;

    .line 16
    .line 17
    iget-object p0, p0, LD1/u;->c:Lg4/a;

    .line 18
    .line 19
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/util/f;

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, LD1/u;->c(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/f;)LD1/t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, LD1/u;->b()LD1/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
