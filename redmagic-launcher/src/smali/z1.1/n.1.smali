.class public final Lz1/n;
.super Ljava/lang/Object;
.source "AllAppsList_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lz1/m;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ls1/P;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/n;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/n;->b:Lg4/a;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;)Lz1/n;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/f;",
            ">;)",
            "Lz1/n;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lz1/n;-><init>(Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Ls1/P;Lcom/android/launcher3/f;)Lz1/m;
    .locals 1

    .line 1
    new-instance v0, Lz1/m;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lz1/m;-><init>(Ls1/P;Lcom/android/launcher3/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lz1/m;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/n;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ls1/P;

    .line 8
    .line 9
    iget-object p0, p0, Lz1/n;->b:Lg4/a;

    .line 10
    .line 11
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/f;

    .line 16
    .line 17
    invoke-static {v0, p0}, Lz1/n;->c(Ls1/P;Lcom/android/launcher3/f;)Lz1/m;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lz1/n;->b()Lz1/m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
