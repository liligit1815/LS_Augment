.class public final synthetic Lcom/android/launcher3/dragndrop/x;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/dragndrop/y;


# instance fields
.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/dragndrop/x;->g:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final getViewType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/x;->g:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/dragndrop/y;->j(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
