.class public final synthetic LD1/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LD1/t;


# direct methods
.method public synthetic constructor <init>(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/p;->g:LD1/t;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LD1/p;->g:LD1/t;

    .line 2
    .line 3
    invoke-static {p0}, LD1/t;->d(LD1/t;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
