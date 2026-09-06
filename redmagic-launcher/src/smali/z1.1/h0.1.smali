.class public final Lz1/h0;
.super Ljava/lang/Object;
.source "BaseLauncherBinder_BaseLauncherBinderFactory_Impl.java"

# interfaces
.implements Lz1/O$a;


# instance fields
.field private final a:Lz1/i0;


# direct methods
.method constructor <init>(Lz1/i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/h0;->a:Lz1/i0;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lz1/i0;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/i0;",
            ")",
            "Lf4/f<",
            "Lz1/O$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/h0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/h0;-><init>(Lz1/i0;)V

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
.method public a([Lz1/y0$b;)Lz1/O;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/h0;->a:Lz1/i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/i0;->b([Lz1/y0$b;)Lz1/O;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
