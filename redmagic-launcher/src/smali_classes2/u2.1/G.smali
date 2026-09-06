.class public final synthetic Lu2/G;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public final synthetic g:Lu2/F$f;


# direct methods
.method public synthetic constructor <init>(Lu2/F$f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/G;->g:Lu2/F$f;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final doFrame(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/G;->g:Lu2/F$f;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lu2/F$f;->a(Lu2/F$f;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
