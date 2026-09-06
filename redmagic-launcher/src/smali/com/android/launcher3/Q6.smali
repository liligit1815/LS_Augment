.class public final synthetic Lcom/android/launcher3/Q6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/io/File;

.field public final synthetic h:Z


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/Q6;->g:Ljava/io/File;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/Q6;->h:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Q6;->g:Ljava/io/File;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/Q6;->h:Z

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/R6;->b(Ljava/io/File;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
