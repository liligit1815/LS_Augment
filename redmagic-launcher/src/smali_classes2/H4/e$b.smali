.class final LH4/e$b;
.super Ljava/lang/Object;
.source "BufferedChannel.kt"

# interfaces
.implements LF4/Y0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final synthetic g:LF4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LF4/l<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final h:LF4/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LF4/k<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public final a()LF4/k;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LF4/k<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/e$b;->h:LF4/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(LK4/A;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LK4/A<",
            "*>;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/e$b;->g:LF4/l;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LF4/l;->c(LK4/A;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
