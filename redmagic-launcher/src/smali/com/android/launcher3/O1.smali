.class public final synthetic Lcom/android/launcher3/O1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/dragndrop/v;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/dragndrop/v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/O1;->a:Lcom/android/launcher3/dragndrop/v;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/O1;->a:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/v;->draw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
