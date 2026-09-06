.class public interface abstract LF4/u0;
.super Ljava/lang/Object;
.source "Job.kt"

# interfaces
.implements Ll4/g$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LF4/u0$a;,
        LF4/u0$b;
    }
.end annotation


# static fields
.field public static final b:LF4/u0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LF4/u0$b;->g:LF4/u0$b;

    .line 2
    .line 3
    sput-object v0, LF4/u0;->b:LF4/u0$b;

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public abstract A(ZZLu4/l;)LF4/b0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lu4/l<",
            "-",
            "Ljava/lang/Throwable;",
            "Lh4/t;",
            ">;)",
            "LF4/b0;"
        }
    .end annotation
.end method

.method public abstract P(Ll4/d;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract U(LF4/s;)LF4/q;
.end method

.method public abstract c(Ljava/util/concurrent/CancellationException;)V
.end method

.method public abstract isActive()Z
.end method

.method public abstract n()Ljava/util/concurrent/CancellationException;
.end method

.method public abstract start()Z
.end method
