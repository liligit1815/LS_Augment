.class public final Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;
.super Ljava/lang/Object;
.source "RegionSampler.kt"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/regionsampling/RegionSampler;-><init>(Landroid/view/View;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZLandroid/app/WallpaperManager;Lu4/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/regionsampling/RegionSampler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;->this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;->this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/systemui/shared/regionsampling/RegionSampler;->getSampledView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLocationOnScreen()[I

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    aget p1, p1, v0

    .line 13
    .line 14
    if-ltz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;->this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/systemui/shared/regionsampling/RegionSampler;->getSampledView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getLocationOnScreen()[I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x1

    .line 27
    aget p1, p1, v0

    .line 28
    .line 29
    if-gez p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p1, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {p1, p2, p3, p4, p5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    new-instance p2, Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-direct {p2, p6, p7, p8, p9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;->this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/systemui/shared/regionsampling/RegionSampler;->stopRegionSampler()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/systemui/shared/regionsampling/RegionSampler$layoutChangedListener$1;->this$0:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/systemui/shared/regionsampling/RegionSampler;->startRegionSampler()V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method
