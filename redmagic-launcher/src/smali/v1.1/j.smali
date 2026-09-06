.class public final synthetic Lv1/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;

.field public final synthetic b:LO0/d;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;LO0/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv1/j;->a:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;

    .line 5
    .line 6
    iput-object p2, p0, Lv1/j;->b:LO0/d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv1/j;->a:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;

    .line 2
    .line 3
    iget-object p0, p0, Lv1/j;->b:LO0/d;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->S(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;LO0/d;Ljava/lang/Integer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
