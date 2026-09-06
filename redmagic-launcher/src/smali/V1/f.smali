.class public final synthetic LV1/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LV1/y;


# direct methods
.method public synthetic constructor <init>(LV1/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/f;->g:LV1/y;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LV1/f;->g:LV1/y;

    .line 2
    .line 3
    invoke-static {p0}, LV1/y;->u(LV1/y;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
