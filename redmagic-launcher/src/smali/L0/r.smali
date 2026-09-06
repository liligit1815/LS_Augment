.class public final synthetic LL0/r;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LL0/n$c;

.field public final synthetic h:LL0/n$b;

.field public final synthetic i:LL0/n$b;


# direct methods
.method public synthetic constructor <init>(LL0/n$c;LL0/n$b;LL0/n$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL0/r;->g:LL0/n$c;

    .line 5
    .line 6
    iput-object p2, p0, LL0/r;->h:LL0/n$b;

    .line 7
    .line 8
    iput-object p3, p0, LL0/r;->i:LL0/n$b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/r;->g:LL0/n$c;

    .line 2
    .line 3
    iget-object v1, p0, LL0/r;->h:LL0/n$b;

    .line 4
    .line 5
    iget-object p0, p0, LL0/r;->i:LL0/n$b;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LL0/n$c;->c(LL0/n$c;LL0/n$b;LL0/n$b;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
