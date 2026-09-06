.class public final synthetic Lcom/android/systemui/shared/regionsampling/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/regionsampling/RegionSampler;

.field public final synthetic h:Landroid/graphics/RectF;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/regionsampling/RegionSampler;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/regionsampling/a;->g:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/regionsampling/a;->h:Landroid/graphics/RectF;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/regionsampling/a;->g:Lcom/android/systemui/shared/regionsampling/RegionSampler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/regionsampling/a;->h:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/systemui/shared/regionsampling/RegionSampler;->b(Lcom/android/systemui/shared/regionsampling/RegionSampler;Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
