.class public final synthetic LX1/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LX1/j;


# direct methods
.method public synthetic constructor <init>(LX1/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LX1/f;->g:LX1/j;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LX1/f;->g:LX1/j;

    .line 2
    .line 3
    invoke-static {p0}, LX1/j;->M(LX1/j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
