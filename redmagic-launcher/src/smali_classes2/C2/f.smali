.class public final LC2/f;
.super Ljava/lang/Object;
.source "UnfoldRemoteModule_ProvideTransitionProviderFactory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Ljava/util/Optional<",
        "Lcom/android/systemui/unfold/progress/i;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final a:LC2/d;

.field private final b:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "LD2/f;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "LF2/a$a;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LC2/d;Lf4/f;Lf4/f;Lf4/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC2/d;",
            "Lf4/f<",
            "LD2/f;",
            ">;",
            "Lf4/f<",
            "LF2/a$a;",
            ">;",
            "Lf4/f<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC2/f;->a:LC2/d;

    .line 5
    .line 6
    iput-object p2, p0, LC2/f;->b:Lf4/f;

    .line 7
    .line 8
    iput-object p3, p0, LC2/f;->c:Lf4/f;

    .line 9
    .line 10
    iput-object p4, p0, LC2/f;->d:Lf4/f;

    .line 11
    .line 12
    return-void
.end method

.method public static a(LC2/d;Lf4/f;Lf4/f;Lf4/f;)LC2/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC2/d;",
            "Lf4/f<",
            "LD2/f;",
            ">;",
            "Lf4/f<",
            "LF2/a$a;",
            ">;",
            "Lf4/f<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;)",
            "LC2/f;"
        }
    .end annotation

    .line 1
    new-instance v0, LC2/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, LC2/f;-><init>(LC2/d;Lf4/f;Lf4/f;Lf4/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(LC2/d;LD2/f;LF2/a$a;Lg4/a;)Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC2/d;",
            "LD2/f;",
            "LF2/a$a;",
            "Lg4/a<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;)",
            "Ljava/util/Optional<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, LC2/d;->b(LD2/f;LF2/a$a;Lg4/a;)Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lf4/e;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/Optional;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public b()Ljava/util/Optional;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LC2/f;->a:LC2/d;

    .line 2
    .line 3
    iget-object v1, p0, LC2/f;->b:Lf4/f;

    .line 4
    .line 5
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, LD2/f;

    .line 10
    .line 11
    iget-object v2, p0, LC2/f;->c:Lf4/f;

    .line 12
    .line 13
    invoke-interface {v2}, Lg4/a;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, LF2/a$a;

    .line 18
    .line 19
    iget-object p0, p0, LC2/f;->d:Lf4/f;

    .line 20
    .line 21
    invoke-static {v0, v1, v2, p0}, LC2/f;->c(LC2/d;LD2/f;LF2/a$a;Lg4/a;)Ljava/util/Optional;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, LC2/f;->b()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
