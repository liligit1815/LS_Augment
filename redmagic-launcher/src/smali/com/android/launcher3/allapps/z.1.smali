.class public final synthetic Lcom/android/launcher3/allapps/z;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/allapps/z;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/z;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/z;->a:Ljava/util/List;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/z;->b:Z

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/allapps/D;->b(Ljava/util/List;ZLcom/android/launcher3/BubbleTextView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
