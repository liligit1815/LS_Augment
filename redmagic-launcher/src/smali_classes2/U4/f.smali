.class public final LU4/f;
.super Ljava/lang/Object;
.source "OperatorObserveOn.java"

# interfaces
.implements Lrx/b$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU4/f$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/b$b<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field private final a:Lrx/e;

.field private final b:Z

.field private final c:I


# direct methods
.method public constructor <init>(Lrx/e;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/f;->a:Lrx/e;

    .line 5
    .line 6
    iput-boolean p2, p0, LU4/f;->b:Z

    .line 7
    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget p3, LW4/d;->i:I

    .line 12
    .line 13
    :goto_0
    iput p3, p0, LU4/f;->c:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)Lrx/h;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)",
            "Lrx/h<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/f$a;

    .line 2
    .line 3
    iget-object v1, p0, LU4/f;->a:Lrx/e;

    .line 4
    .line 5
    iget-boolean v2, p0, LU4/f;->b:Z

    .line 6
    .line 7
    iget p0, p0, LU4/f;->c:I

    .line 8
    .line 9
    invoke-direct {v0, v1, p1, v2, p0}, LU4/f$a;-><init>(Lrx/e;Lrx/h;ZI)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, LU4/f$a;->b()V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/f;->a(Lrx/h;)Lrx/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
