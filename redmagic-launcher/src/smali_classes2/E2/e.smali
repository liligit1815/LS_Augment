.class public final LE2/e;
.super Ljava/lang/Object;
.source "RotationChangeProvider_Factory_Impl.java"

# interfaces
.implements LE2/c$a;


# instance fields
.field private final a:LE2/d;


# direct methods
.method constructor <init>(LE2/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LE2/e;->a:LE2/d;

    .line 5
    .line 6
    return-void
.end method

.method public static b(LE2/d;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LE2/d;",
            ")",
            "Lf4/f<",
            "LE2/c$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LE2/e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LE2/e;-><init>(LE2/d;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public a(Landroid/os/Handler;)LE2/c;
    .locals 0

    .line 1
    iget-object p0, p0, LE2/e;->a:LE2/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LE2/d;->b(Landroid/os/Handler;)LE2/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
