.class public final synthetic Lcom/android/launcher3/D6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/Workspace;

.field public final synthetic b:Landroid/graphics/Rect;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Workspace;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/D6;->a:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/D6;->b:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D6;->a:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/D6;->b:Landroid/graphics/Rect;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/Workspace;->S(Lcom/android/launcher3/Workspace;Landroid/graphics/Rect;Lcom/android/launcher3/CellLayout;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
