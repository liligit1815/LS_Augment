.class public final synthetic LS1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LS1/c;


# direct methods
.method public synthetic constructor <init>(LS1/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LS1/b;->g:LS1/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LS1/b;->g:LS1/c;

    .line 2
    .line 3
    invoke-static {p0}, LS1/c;->b(LS1/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
