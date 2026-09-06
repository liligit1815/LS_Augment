.class public final Ls1/a0;
.super Ljava/lang/Object;
.source "LauncherIcons_LauncherIconsFactory_Impl.java"

# interfaces
.implements Ls1/X$c;


# instance fields
.field private final a:Ls1/Y;


# direct methods
.method constructor <init>(Ls1/Y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/a0;->a:Ls1/Y;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ls1/Y;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ls1/Y;",
            ")",
            "Lf4/f<",
            "Ls1/X$c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ls1/a0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ls1/a0;-><init>(Ls1/Y;)V

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
.method public a(Ljava/util/concurrent/ConcurrentLinkedQueue;)Ls1/X;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ls1/X;",
            ">;)",
            "Ls1/X;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ls1/a0;->a:Ls1/Y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls1/Y;->b(Ljava/util/concurrent/ConcurrentLinkedQueue;)Ls1/X;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
